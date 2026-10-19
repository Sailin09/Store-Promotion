import {decrypt} from '../pinterest-publisher/core.mjs';
import {equal} from '../pinterest-oauth/core.mjs';
import {ensureBoard,HANDLE} from './board.mjs';
const reply=(data,status=200)=>new Response(JSON.stringify(data),{status,headers:{'Content-Type':'application/json','Cache-Control':'no-store'}});
Deno.serve(async req=>{
 if(req.method!=='POST')return reply({error:'method'},405);
 const env=n=>Deno.env.get(n), key=env('SUPABASE_SERVICE_ROLE_KEY'),supplied=req.headers.get('x-publisher-key')||(req.headers.get('Authorization')||'').replace(/^Bearer /,'');
 if(!key||!supplied)return reply({error:'unauthorized'},401);
 const request=async(url,options={})=>fetch(url,{...options,signal:AbortSignal.timeout(15000)});
 if(!await equal(key,supplied)){
  try{const a=await request(env('SUPABASE_URL')+'/rest/v1/rpc/authenticate_pinterest_publisher',{method:'POST',headers:{apikey:supplied,Authorization:'Bearer '+supplied,'Content-Type':'application/json'},body:'{}'});if(!a.ok||await a.json()!==true)return reply({error:'unauthorized'},401);}catch{return reply({error:'unauthorized'},401);}
 }
 try{
  const db=async(path,method='GET',body,prefer)=>{const r=await request(env('SUPABASE_URL')+'/rest/v1/'+path,{method,headers:{apikey:key,Authorization:'Bearer '+key,'Content-Type':'application/json',...(prefer?{Prefer:prefer}:{})},body:body===undefined?undefined:JSON.stringify(body)});if(!r.ok)throw new Error('database');const t=await r.text();return t?JSON.parse(t):[];};
  const settings=await db('pinterest_publish_settings?singleton=eq.true&select=access_tier');if(settings[0]?.access_tier!=='standard')throw new Error('standard_required');
  const accounts=await db('social_accounts?platform=eq.pinterest&active=eq.true&handle=eq.'+HANDLE+'&select=id');if(accounts.length!==1)throw new Error('account_missing');
  const id=accounts[0].id,creds=await db('pinterest_oauth_credentials?social_account_id=eq.'+id+'&select=encrypted_tokens,access_expires_at');if(creds.length!==1||Date.parse(creds[0].access_expires_at)<Date.now()+300000)throw new Error('credential_refresh_required');
  const tokens=await decrypt(creds[0].encrypted_tokens,env('PINTEREST_TOKEN_KEY'),id);
  const api=async(path,method='GET',body)=>{const r=await request('https://api.pinterest.com/v5'+path,{method,headers:{Authorization:'Bearer '+tokens.access_token,'Content-Type':'application/json'},body:body===undefined?undefined:JSON.stringify(body)});if(!r.ok)throw new Error(method==='POST'?'uncertain_create':'api_read_failed');return r.json();};
  const result=await ensureBoard({profile:await api('/user_account'),scopes:(tokens.scope||'').split(/[ ,]+/),list:async()=>{let all=[],bookmark;for(let i=0;i<10;i++){const page=await api('/boards?page_size=100'+(bookmark?'&bookmark='+encodeURIComponent(bookmark):''));all.push(...page.items||[]);bookmark=page.bookmark;if(!bookmark)return all;}throw new Error('incomplete_board_list');},claim:async()=>{const r=await db('pinterest_board_setup_operations','POST',{operation:'p4-jewelry-20261019',account_id:id,status:'dispatched'},'resolution=ignore-duplicates,return=representation');return r.length===1;},create:b=>api('/boards','POST',b),get:bid=>api('/boards/'+bid),save:async b=>{await db('pinterest_board_setup_operations','POST',{operation:'p4-jewelry-20261019',account_id:id,status:'verified',board_id:b.id,board_name:b.name,privacy:b.privacy,verified_at:new Date().toISOString()},'resolution=merge-duplicates');}});
  return reply({status:result.status,handle:HANDLE,board:{id:result.board.id,name:result.board.name,privacy:result.board.privacy,owner:result.board.owner.username}});
 }catch(e){const allowed=['account_mismatch','scope_missing','ambiguous_or_private_board','board_verification','prior_attempt_requires_reconciliation','uncertain_create','database','standard_required','account_missing','credential_refresh_required','api_read_failed','incomplete_board_list'];return reply({status:'blocked',reason:allowed.includes(e.message)?e.message:'request_failed'},503);}
});
