import { encrypt, equal } from '../pinterest-oauth/core.mjs';
const API = 'https://api.pinterest.com/v5';
const requiredScopes = ['user_accounts:read','boards:read','pins:read','pins:write'];
const text = new TextEncoder();
export async function decrypt(value, secret, account) {
  const envelope = JSON.parse(value);
  if (envelope.version !== 1) throw new Error('credential_format');
  const bytes = s => Uint8Array.from(atob(s), c => c.charCodeAt(0));
  const raw = bytes(secret);
  if (raw.length !== 32) throw new Error('credential_key');
  const key = await crypto.subtle.importKey('raw', raw, 'AES-GCM', false, ['decrypt']);
  return JSON.parse(new TextDecoder().decode(await crypto.subtle.decrypt({name:'AES-GCM',iv:bytes(envelope.iv),additionalData:text.encode(account)},key,bytes(envelope.ciphertext))));
}
export function payload(snapshot, board) {
  const link = new URL(snapshot.link), image = new URL(snapshot.image_url);
  if (link.protocol !== 'https:' || link.hostname !== 'www.etsy.com' || link.username || link.password || link.port || link.hash ||
      !link.pathname.startsWith('/listing/'+snapshot.listing_id+'/') || !/^\d+$/.test(snapshot.listing_id)) throw new Error('listing_link');
  if (image.protocol !== 'https:' || image.hostname !== 'i.etsystatic.com' || image.username || image.password || image.port || image.hash || !/\.(jpg|jpeg|png|webp)$/i.test(image.pathname)) throw new Error('image_source');
  if (!/^\d+$/.test(board) || typeof snapshot.handle !== 'string' || !snapshot.handle ||
      typeof snapshot.title !== 'string' || !snapshot.title.trim() || snapshot.title.length>100 ||
      typeof snapshot.description !== 'string' || !snapshot.description.trim() || snapshot.description.length>800) throw new Error('creative_invalid');
  return {board_id:board,title:snapshot.title,description:snapshot.description,link:link.href,media_source:{source_type:'image_url',url:image.href}};
}
export function makePublisher(env, fetcher=fetch) {
  const reply=(data,status=200)=>new Response(JSON.stringify(data),{status,headers:{'Content-Type':'application/json','Cache-Control':'no-store'}});
  async function db(path, method='GET', data) {
    const r=await fetcher(env('SUPABASE_URL')+'/rest/v1/'+path,{method,headers:{apikey:env('SUPABASE_SERVICE_ROLE_KEY'),Authorization:'Bearer '+env('SUPABASE_SERVICE_ROLE_KEY'),'Content-Type':'application/json'},body:data===undefined?undefined:JSON.stringify(data),signal:AbortSignal.timeout(10000)});
    if(!r.ok) throw new Error('database');
    const s=await r.text();return s?JSON.parse(s):null;
  }
  const rpc=(name,args={})=>db('rpc/'+name,'POST',args);
  const get=async(path,token)=>{
    const r=await fetcher(API+path,{headers:{Authorization:'Bearer '+token},signal:AbortSignal.timeout(10000)});
    if(!r.ok) throw new Error('pinterest_read_'+r.status);
    return r.json();
  };
  return async req=>{
    if(req.method!=='POST')return reply({error:'Use POST'},405);
    const key=env('SUPABASE_SERVICE_ROLE_KEY');
    const supplied=req.headers.get('x-publisher-key') ?? (req.headers.get('Authorization')||'').replace(/^Bearer /,'');
    if(!key || !(await equal(supplied,key)))return reply({error:'Unauthorized'},401);
    let job, dispatched=false, knownPin;
    try {
      // One item per invocation bounds runtime and gives every item its own durable attempt.
      job=await rpc('claim_pinterest_publish');
      if(job.status!=='claimed')return reply(job);
      const s=job.snapshot, body=payload(s,job.board_id);
      const creds=await db('pinterest_oauth_credentials?social_account_id=eq.'+encodeURIComponent(s.account_id)+'&select=encrypted_tokens,access_expires_at');
      if(creds.length!==1)throw new Error('credential_missing');
      const cred=creds[0];
      let tokens=await decrypt(cred.encrypted_tokens,env('PINTEREST_TOKEN_KEY'),s.account_id);
      if(!requiredScopes.every(scope=>(tokens.scope||'').split(/[ ,]+/).includes(scope)))throw new Error('scope_missing');
      const expires=Date.parse(cred.access_expires_at);
      if(!Number.isFinite(expires))throw new Error('credential_expiry');
      if(expires<Date.now()+300000){
        if(!tokens.refresh_token || !env('PINTEREST_APP_SECRET'))throw new Error('refresh_configuration');
        const r=await fetcher(API+'/oauth/token',{method:'POST',headers:{Authorization:'Basic '+btoa('1617125:'+env('PINTEREST_APP_SECRET')),'Content-Type':'application/x-www-form-urlencoded'},body:new URLSearchParams({grant_type:'refresh_token',refresh_token:tokens.refresh_token}),signal:AbortSignal.timeout(10000)});
        if(!r.ok)throw new Error('refresh_rejected');
        const next=await r.json();
        if(typeof next.access_token!=='string'||!next.access_token||!Number.isFinite(next.expires_in)||next.expires_in<=0)throw new Error('refresh_invalid');
        tokens={...tokens,...next,refresh_token:next.refresh_token||tokens.refresh_token,scope:next.scope||tokens.scope,issued_at:new Date().toISOString()};
        if(!requiredScopes.every(scope=>tokens.scope.split(/[ ,]+/).includes(scope)))throw new Error('scope_missing');
        const saved=await rpc('refresh_pinterest_credential',{p_account:s.account_id,p_old:cred.encrypted_tokens,p_new:await encrypt(tokens,env('PINTEREST_TOKEN_KEY'),s.account_id),p_scopes:tokens.scope,p_expires:new Date(Date.now()+next.expires_in*1000).toISOString()});
        if(saved!==true)throw new Error('credential_changed');
      }
      const profile=await get('/user_account',tokens.access_token);
      if(profile.username?.toLowerCase()!==s.handle.toLowerCase())throw new Error('account_mismatch');
      const board=await get('/boards/'+job.board_id,tokens.access_token);
      if(board.id!==job.board_id || board.owner?.username?.toLowerCase()!==s.handle.toLowerCase() || board.privacy!=='PUBLIC' || board.is_ads_only===true)throw new Error('board_mismatch_or_private');
      // HEAD is unauthenticated, allowlisted and cannot redirect to an internal host.
      const image=await fetcher(body.media_source.url,{method:'HEAD',redirect:'error',signal:AbortSignal.timeout(10000)});
      if(!image.ok||!/^image\//i.test(image.headers.get('Content-Type')||''))throw new Error('image_unavailable');
      if(await rpc('dispatch_pinterest_publish',{p_attempt:job.attempt_id})!==true)throw new Error('dispatch_gate');
      dispatched=true;
      // Exactly one POST. Any timeout/HTTP error/invalid response stops for reconciliation.
      const result=await fetcher(API+'/pins',{method:'POST',headers:{Authorization:'Bearer '+tokens.access_token,'Content-Type':'application/json'},body:JSON.stringify(body),signal:AbortSignal.timeout(15000)});
      if(!result.ok)throw new Error('pin_response_'+result.status);
      const pin=await result.json();
      if(typeof pin.id!=='string'||!/^\d+$/.test(pin.id))throw new Error('pin_response_invalid');
      knownPin=pin.id;
      await rpc('finish_pinterest_publish',{p_attempt:job.attempt_id,p_outcome:'published',p_pin_id:knownPin});
      return reply({status:'published',queue_id:s.queue_id,url:'https://www.pinterest.com/pin/'+knownPin+'/'});
    } catch(error) {
      // Only our short categorical messages are stored. Never log token or upstream bodies.
      const code=/^(credential_[a-z]+|refresh_[a-z]+|scope_missing|account_mismatch|board_mismatch_or_private|image_unavailable|dispatch_gate|listing_link|image_source|creative_invalid|pin_response_\d+|pin_response_invalid|pinterest_read_\d+|database)$/.test(error?.message)?error.message:'request_failed';
      if(job?.attempt_id){
        try {
          // If Pin creation succeeded, retry only the idempotent database finalization.
          await rpc('finish_pinterest_publish',{p_attempt:job.attempt_id,p_outcome:knownPin?'published':dispatched?'uncertain':'failed',p_pin_id:knownPin??null,p_error:knownPin?null:code});
          if(knownPin)return reply({status:'published',url:'https://www.pinterest.com/pin/'+knownPin+'/'});
        } catch { /* durable attempt remains reserved; never issue a second Pin POST */ }
      }
      return reply({status:dispatched?'reconciliation_required':'paused',attempt_id:job?.attempt_id??null,pin_id:knownPin??null,error:code},503);
    }
  };
}
