import {test} from 'node:test';
import assert from 'node:assert/strict';
import {makeHandler,ORIGIN,REDIRECT,SCOPES,encrypt,hash,matchingAccount,validateTokens} from '../supabase/functions/pinterest-oauth/core.mjs';
const values={PINTEREST_APP_SECRET:'test-secret',PINTEREST_CONNECT_KEY:'x'.repeat(32),PINTEREST_TOKEN_KEY:btoa('k'.repeat(32)),SUPABASE_URL:'https://test.supabase.co',SUPABASE_SERVICE_ROLE_KEY:'test-service'};
const env=k=>values[k]||'';
const proof='a'.repeat(64),state='b'.repeat(64),id='11111111-1111-1111-1111-111111111111';
const tokens={access_token:'test-access',refresh_token:'test-refresh',expires_in:3600,scope:SCOPES.join(' ')};
const req=(body,origin=ORIGIN)=>new Request('https://test/functions/v1/pinterest-oauth',{method:'POST',headers:{Origin:origin},body:JSON.stringify(body)});
const json=o=>new Response(JSON.stringify(o));
test('reject untrusted origins and incorrect admin key before accessing database',async()=>{
  const handler=makeHandler(env,()=>{throw Error('Must not call');});
  assert.equal((await handler(req({action:'start'},'https://evil.test'))).status,403);
  assert.equal((await handler(req({action:'start',key:'wrong'}))).status,401);
});
test('missing backend secrets fail closed',async()=>assert.equal((await makeHandler(()=>'',()=>{})(req({}))).status,503));
test('account mismatch and missing scopes fail closed',()=>{
  assert.equal(matchingAccount({active:true,handle:'sailing_981'},{username:'other'}),false);
  assert.equal(matchingAccount({active:false,handle:'sailing_981'},{username:'sailing_981'}),false);
  assert.throws(()=>validateTokens({...tokens,scope:'pins:read'}));
});
test('credentials encrypted with unique IV and authenticated account binding',async()=>{
  const one=JSON.parse(await encrypt(tokens,values.PINTEREST_TOKEN_KEY,id));
  const two=JSON.parse(await encrypt(tokens,values.PINTEREST_TOKEN_KEY,id));
  assert.notEqual(one.iv,two.iv);assert.ok(!JSON.stringify(one).includes('test-access'));
  const bytes=s=>Uint8Array.from(atob(s),c=>c.charCodeAt(0));
  const key=await crypto.subtle.importKey('raw',bytes(values.PINTEREST_TOKEN_KEY),'AES-GCM',false,['decrypt']);
  const plain=await crypto.subtle.decrypt({name:'AES-GCM',iv:bytes(one.iv),additionalData:new TextEncoder().encode(id)},key,bytes(one.ciphertext));
  assert.deepEqual(JSON.parse(new TextDecoder().decode(plain)),tokens);
  await assert.rejects(crypto.subtle.decrypt({name:'AES-GCM',iv:bytes(one.iv),additionalData:new TextEncoder().encode('wrong-account')},key,bytes(one.ciphertext)));
});
test('start stores only hashed browser-bound state and fixed redirect',async()=>{
  let stored;
  const handler=makeHandler(env,async(url,opts)=>{
    if(url.includes('social_accounts?'))return json([{id,handle:'sailing_981',active:true}]);
    if(opts.method==='POST')stored=JSON.parse(opts.body);
    return new Response(null,{status:204});
  });
  const r=await handler(req({action:'start',key:values.PINTEREST_CONNECT_KEY,account:'P2',browserProof:proof}));
  assert.equal(r.status,200);const result=await r.json();
  assert.equal(stored.state_hash,await hash(result.state));assert.equal(stored.browser_hash,await hash(proof));
  assert.equal(new URL(result.url).searchParams.get('redirect_uri'),REDIRECT);
});
function fakeBackend(username='sailing_981'){
  let consumed=false,saved=null,exchanges=0;
  const fetcher=async(url,opts)=>{
    if(url.includes('consume_pinterest_oauth_state')){
      const b=JSON.parse(opts.body);
      if(consumed||b.p_state_hash!==await hash(state)||b.p_browser_hash!==await hash(proof))return json([]);
      consumed=true;return json([{social_account_id:id,expected_handle:'sailing_981'}]);
    }
    if(url.endsWith('/oauth/token')){exchanges++;return json(tokens);}
    if(url.endsWith('/user_account'))return json({username});
    if(url.includes('social_accounts?'))return json([{id,handle:'sailing_981',active:true}]);
    if(url.includes('save_pinterest_oauth_connection')){saved=JSON.parse(opts.body);return new Response(null,{status:204});}
    throw Error('Unexpected request');
  };
  return {fetcher,get saved(){return saved;},get exchanges(){return exchanges;}};
}
const complete={action:'complete',state,browserProof:proof,code:'test-code'};
test('successful callback saves encrypted credentials once; replay rejected',async()=>{
  const mock=fakeBackend(),handler=makeHandler(env,mock.fetcher);
  const r=await handler(req(complete));assert.equal(r.status,200);
  assert.equal(mock.saved.p_account_id,id);assert.ok(!mock.saved.p_ciphertext.includes('test-access'));
  assert.ok(!(await r.text()).includes('test-refresh'));
  assert.equal((await handler(req(complete))).status,400);assert.equal(mock.exchanges,1);
});
test('wrong browser proof cannot consume state or exchange code',async()=>{
  const mock=fakeBackend(),handler=makeHandler(env,mock.fetcher);
  assert.equal((await handler(req({...complete,browserProof:'c'.repeat(64)}))).status,400);assert.equal(mock.exchanges,0);
  assert.equal((await handler(req(complete))).status,200);
});
test('wrong Pinterest account never saves credentials',async()=>{
  const mock=fakeBackend('another_account'),handler=makeHandler(env,mock.fetcher);
  assert.equal((await handler(req(complete))).status,409);assert.equal(mock.saved,null);
});
