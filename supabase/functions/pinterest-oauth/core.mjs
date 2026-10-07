export const ORIGIN = 'https://sailin09.github.io';
export const REDIRECT = ORIGIN + '/Store-Promotion/pinterest-connect.html';
export const SCOPES = ['user_accounts:read', 'boards:read', 'boards:write', 'pins:read', 'pins:write'];
const enc = new TextEncoder();
export const random = () => Array.from(crypto.getRandomValues(new Uint8Array(32)), b => b.toString(16).padStart(2,'0')).join('');
export async function hash(s) { return Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256', enc.encode(s))), b=>b.toString(16).padStart(2,'0')).join(''); }
export async function equal(a,b) { const x=await hash(a), y=await hash(b); let diff=0; for(let i=0;i<x.length;i++)diff|=x.charCodeAt(i)^y.charCodeAt(i); return diff===0; }
export async function encrypt(value, keyBase64, accountId) {
  const raw=Uint8Array.from(atob(keyBase64), c=>c.charCodeAt(0));
  if(raw.length!==32)throw new Error('configuration');
  const key=await crypto.subtle.importKey('raw',raw,'AES-GCM',false,['encrypt']);
  const iv=crypto.getRandomValues(new Uint8Array(12));
  const encrypted=new Uint8Array(await crypto.subtle.encrypt({name:'AES-GCM',iv,additionalData:enc.encode(accountId)},key,enc.encode(JSON.stringify(value))));
  const base64=b=>btoa(String.fromCharCode(...b));
  return JSON.stringify({version:1,iv:base64(iv),ciphertext:base64(encrypted)});
}
export function validateTokens(t) {
  if(typeof t.access_token!=='string'||!t.access_token ||typeof t.refresh_token!=='string'||!t.refresh_token || !Number.isFinite(t.expires_in)||t.expires_in<=0)throw new Error('token');
  const scopes=typeof t.scope==='string'?t.scope.split(/[ ,]+/):[];
  if(!SCOPES.every(s=>scopes.includes(s)))throw new Error('scope');
}
export function matchingAccount(account, profile) {
  return account.active && typeof account.handle==='string' && typeof profile.username==='string' && account.handle.toLowerCase()===profile.username.toLowerCase();
}
export function makeHandler(env, fetcher=fetch) {
  const reply=(data,status=200)=>new Response(JSON.stringify(data),{status,headers:{'Content-Type':'application/json','Cache-Control':'no-store','Access-Control-Allow-Origin':ORIGIN,'Vary':'Origin','Access-Control-Allow-Headers':'content-type','Access-Control-Allow-Methods':'POST, OPTIONS'}});
  async function db(path,method='GET',data) {
    const r=await fetcher(env('SUPABASE_URL')+'/rest/v1/'+path,{method,headers:{apikey:env('SUPABASE_SERVICE_ROLE_KEY'),Authorization:'Bearer '+env('SUPABASE_SERVICE_ROLE_KEY'),'Content-Type':'application/json'},body:data===undefined?undefined:JSON.stringify(data),signal:AbortSignal.timeout(15000)});
    if(!r.ok) {
      const detail=await r.json().catch(()=>({}));
      const code=typeof detail.code==='string' && /^[A-Z0-9]{3,12}$/.test(detail.code) ? detail.code : 'unknown';
      console.error('pinterest_oauth_database',r.status,code);
      throw new Error('database');
    }
    const text=await r.text();return text?JSON.parse(text):null;
  }
  return async req=>{
    if(req.headers.get('Origin')!==ORIGIN)return reply({error:'Origin not allowed'},403);
    if(req.method==='OPTIONS')return reply({});
    if(req.method!=='POST')return reply({error:'Use POST'},405);
    try {
      const text=await req.text();if(text.length>8192)return reply({error:'Request too large'},413);
      const b=JSON.parse(text);
      for(const k of ['PINTEREST_APP_SECRET','PINTEREST_CONNECT_KEY','PINTEREST_TOKEN_KEY','SUPABASE_URL','SUPABASE_SERVICE_ROLE_KEY']) if(!env(k))return reply({error:'服务尚未完成安全配置，请联系管理员。'},503);
      if(env('PINTEREST_CONNECT_KEY').length<32 || atob(env('PINTEREST_TOKEN_KEY')).length!==32)return reply({error:'服务密钥配置无效。'},503);
      if(b.action==='start') {
        if(typeof b.key!=='string'||!(await equal(b.key,env('PINTEREST_CONNECT_KEY'))))return reply({error:'连接口令不正确。'},401);
        if(!/^P[1-5]$/.test(b.account)||! /^[a-f0-9]{64}$/.test(b.browserProof))return reply({error:'Invalid request'},400);
        const rows=await db('social_accounts?select=id,handle,active&platform=eq.pinterest&account_name=eq.'+b.account);
        const a=rows[0];if(rows.length!==1||!a.active||!a.handle)return reply({error:'账号未登记或已停用。'},409);
        await db('pinterest_oauth_states?expires_at=lt.'+encodeURIComponent(new Date().toISOString()),'DELETE');
        const state=random();
        await db('pinterest_oauth_states','POST',{state_hash:await hash(state),browser_hash:await hash(b.browserProof),social_account_id:a.id,expected_handle:a.handle});
        const u=new URL('https://www.pinterest.com/oauth/');
        u.search=new URLSearchParams({client_id:'1617125',redirect_uri:REDIRECT,response_type:'code',scope:SCOPES.join(','),state}).toString();
        return reply({url:u.href,state,expectedHandle:a.handle});
      }
      if(b.action!=='complete'||! /^[a-f0-9]{64}$/.test(b.state)||! /^[a-f0-9]{64}$/.test(b.browserProof)||typeof b.code!=='string'||!b.code||b.code.length>4096)return reply({error:'Invalid callback'},400);
      const rows=await db('rpc/consume_pinterest_oauth_state','POST',{p_state_hash:await hash(b.state),p_browser_hash:await hash(b.browserProof)});
      if(rows.length!==1)return reply({error:'授权已过期或已使用，请重新连接。'},400);
      const pending=rows[0];
      const tokenResponse=await fetcher('https://api.pinterest.com/v5/oauth/token',{method:'POST',headers:{Authorization:'Basic '+btoa('1617125:'+env('PINTEREST_APP_SECRET')),'Content-Type':'application/x-www-form-urlencoded'},body:new URLSearchParams({grant_type:'authorization_code',code:b.code,redirect_uri:REDIRECT}),signal:AbortSignal.timeout(15000)});
      if(!tokenResponse.ok)return reply({error:'Pinterest 未完成令牌交换，请重新授权。'},502);
      const tokens=await tokenResponse.json();validateTokens(tokens);
      const userResponse=await fetcher('https://api.pinterest.com/v5/user_account',{headers:{Authorization:'Bearer '+tokens.access_token},signal:AbortSignal.timeout(15000)});
      if(!userResponse.ok)throw new Error('profile');
      const profile=await userResponse.json();
      const accounts=await db('social_accounts?select=id,handle,active&platform=eq.pinterest&id=eq.'+encodeURIComponent(pending.social_account_id));
      if(accounts.length!==1||!matchingAccount(accounts[0],profile)||profile.username.toLowerCase()!==pending.expected_handle.toLowerCase())return reply({error:'登录的 Pinterest 账号与所选账号不符，未保存连接。请切换正确账号后重新授权。'},409);
      const ciphertext=await encrypt({...tokens,issued_at:new Date().toISOString()},env('PINTEREST_TOKEN_KEY'),pending.social_account_id);
      await db('rpc/save_pinterest_oauth_connection','POST',{p_account_id:pending.social_account_id,p_username:profile.username,p_ciphertext:ciphertext,p_scopes:tokens.scope,p_expires_at:new Date(Date.now()+tokens.expires_in*1000).toISOString()});
      return reply({username:profile.username,message:'授权连接已保存。Trial 测试权限有效；推广队列仍为草稿，尚未启用自动发布。'});
    }catch (error) { console.error('pinterest_oauth_failure', ['InvalidCharacterError','TypeError','SyntaxError','TimeoutError','Error'].includes(error?.name) ? error.name : 'unknown'); return reply({error:'连接未完成。请检查后台配置，重新发起授权；不要重复使用原回调链接。'},500);}
  };
}
