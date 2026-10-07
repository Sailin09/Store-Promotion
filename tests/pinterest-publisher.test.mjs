import test from 'node:test';
import assert from 'node:assert/strict';
import {makePublisher,payload,decrypt} from '../supabase/functions/pinterest-publisher/core.mjs';
import {encrypt} from '../supabase/functions/pinterest-oauth/core.mjs';
const secret=btoa('k'.repeat(32));
const snapshot={queue_id:'q',account_id:'a',handle:'sailing_981',listing_id:'123',link:'https://www.etsy.com/listing/123/item',image_url:'https://i.etsystatic.com/1/r/il/test.jpg',title:'Test curtain',description:'Product description'};
const scopes='user_accounts:read boards:read pins:read pins:write';
const ok=data=>new Response(JSON.stringify(data),{status:200});
async function fixture(options={}){
 const calls=[]; let finishes=0;
 const cipher=await encrypt({access_token:'access-secret',refresh_token:'refresh-secret',scope:scopes},secret,'a');
 const env=n=>({SUPABASE_SERVICE_ROLE_KEY:'service-secret',SUPABASE_URL:'https://db.example',PINTEREST_TOKEN_KEY:secret,PINTEREST_APP_SECRET:'app-secret'})[n];
 const handler=makePublisher(env,async(url,init={})=>{
  if(url.endsWith('/rpc/authenticate_pinterest_publisher'))return options.alternateService ? ok(true) : new Response('denied',{status:403});
  calls.push({url,method:init.method,body:init.body});
  if(options.trial) url=url.replace(/_trial$/, '');
  if(url.endsWith('/rpc/claim_pinterest_publish'))return ok(options.gate||{status:'claimed',attempt_id:'attempt',board_id:'1234',snapshot:{...snapshot,...options.snapshot}});
  if(url.includes('/pinterest_oauth_credentials?'))return ok([{encrypted_tokens:cipher,access_expires_at:new Date(Date.now()+(options.expired?-10000:3600000)).toISOString()}]);
  if(url.endsWith('/oauth/token'))return ok({access_token:'new-access',refresh_token:'new-refresh',scope:scopes,expires_in:3600});
  if(url.endsWith('/rpc/refresh_pinterest_credential'))return ok(!options.casFail);
  if(url.endsWith('/user_account'))return ok({username:options.wrongAccount?'other':snapshot.handle});
  if(url.endsWith('/boards/1234'))return ok({id:'1234',owner:{username:snapshot.handle},privacy:options.privateBoard?'SECRET':'PUBLIC'});
  if(url.startsWith('https://i.etsystatic.com'))return new Response(null,{status:200,headers:{'Content-Type':'image/jpeg'}});
  if(url.endsWith('/rpc/dispatch_pinterest_publish'))return ok(!options.dispatchFail);
  if(url.endsWith('/pins')){if(options.timeout)throw new Error('Timeout includes secret'); if(options.reject)return new Response('token secret',{status:429});return ok(options.malformed?{}:{id:'9876'});}
  if(url.endsWith('/rpc/finish_pinterest_publish')){finishes++; if(options.finishFail&&finishes===1)throw new Error('database unavailable'); return ok(null);}
  throw new Error('Unexpected endpoint '+url);
 }, options.trial?'trial':'production');
 const run=async(auth='Bearer service-secret')=>handler(new Request('https://worker',{method:'POST',headers:{Authorization:auth}}));
 return {calls,run,handler};
}
const posts=c=>c.filter(x=>x.url.endsWith('/pins'));
test('unauthenticated request cannot touch DB or Pinterest',async()=>{const f=await fixture();assert.equal((await f.run('Bearer bad')).status,401);assert.equal(f.calls.length,0);});
test('Trial/disabled gate performs no external API requests',async()=>{const f=await fixture({gate:{status:'blocked'}});assert.equal((await (await f.run()).json()).status,'blocked');assert.equal(f.calls.length,1);});
test('successful publication only POSTs once and records ID',async()=>{const f=await fixture();assert.equal((await (await f.run()).json()).status,'published');assert.equal(posts(f.calls).length,1);assert.equal(JSON.parse(f.calls.at(-1).body).p_pin_id,'9876');});
for(const flag of ['wrongAccount','privateBoard','dispatchFail','casFail'])test(flag+' blocks publication',async()=>{const f=await fixture({[flag]:true,expired:flag==='casFail'});assert.equal((await f.run()).status,503);assert.equal(posts(f.calls).length,0);});
for(const flag of ['timeout','reject','malformed'])test(flag+' after POST is uncertain and never reposted',async()=>{const f=await fixture({[flag]:true});const body=await(await f.run()).text();assert.ok(body.includes('reconciliation_required'));assert.ok(!body.includes('secret'));assert.equal(posts(f.calls).length,1);assert.equal(JSON.parse(f.calls.at(-1).body).p_outcome,'uncertain');});
test('database recording retry does not repeat Pin creation',async()=>{const f=await fixture({finishFail:true});assert.equal((await(await f.run()).json()).status,'published');assert.equal(posts(f.calls).length,1);assert.equal(f.calls.filter(x=>x.url.endsWith('/rpc/finish_pinterest_publish')).length,2);});
test('refresh rotates encrypted tokens using compare-and-swap before posting',async()=>{const f=await fixture({expired:true});await f.run();const update=f.calls.find(x=>x.url.endsWith('/rpc/refresh_pinterest_credential'));const b=JSON.parse(update.body);assert.equal((await decrypt(b.p_new,secret,'a')).refresh_token,'new-refresh');assert.ok(f.calls.indexOf(update)<f.calls.indexOf(posts(f.calls)[0]));});
test('encrypted tokens are bound to account identity',async()=>{const c=await encrypt({access_token:'x'},secret,'a');await assert.rejects(decrypt(c,secret,'b'));});
test('rejects wrong listings, non-Etsy links and internal image hosts',()=>{for(const patch of [{link:'https://evil.test/listing/123/item'},{link:'https://www.etsy.com/listing/1234/item'},{image_url:'https://127.0.0.1/test.jpg'},{image_url:'https://i.etsystatic.com@evil.test/test.jpg'},{title:'x'.repeat(101)}])assert.throws(()=>payload({...snapshot,...patch},'1234'));});

test('dedicated credential survives proxy Authorization rewriting',async()=>{const f=await fixture({gate:{status:'blocked'}});const r=await f.handler(new Request('https://worker',{method:'POST',headers:{Authorization:'Bearer proxy-token','x-publisher-key':'service-secret'}}));assert.equal(r.status,200);assert.equal((await r.json()).status,'blocked');});
test('wrong dedicated credential is rejected before accessing data',async()=>{const f=await fixture();const r=await f.handler(new Request('https://worker',{method:'POST',headers:{'x-publisher-key':'wrong'}}));assert.equal(r.status,401);assert.equal(f.calls.length,0);});

test('alternative project service credential must be authenticated by Data API',async()=>{const f=await fixture({alternateService:true,gate:{status:'blocked'}});const r=await f.run('Bearer alternative-project-service');assert.equal(r.status,200);assert.equal((await r.json()).status,'blocked');assert.equal(f.calls.length,1);});

test('Trial uses isolated RPCs and reports test result, never production history',async()=>{
 const f=await fixture({trial:true});const r=await(await f.run()).json();
 assert.equal(r.status,'trial_created');assert.equal(posts(f.calls).length,1);
 for(const operation of ['claim','dispatch','finish'])assert.ok(f.calls.some(c=>c.url.endsWith('/rpc/'+operation+'_pinterest_publish_trial')));
 assert.ok(!f.calls.some(c=>/rpc\/(claim|dispatch|finish)_pinterest_publish$/.test(c.url)));
});
test('unapproved Trial demo makes no Pinterest requests',async()=>{
 const f=await fixture({trial:true,gate:{status:'blocked',reason:'reviewed_trial_demo_required'}});
 assert.equal((await(await f.run()).json()).status,'blocked');assert.equal(f.calls.length,1);
});
test('Trial ambiguous response does not retry creation',async()=>{
 const f=await fixture({trial:true,timeout:true});assert.equal((await f.run()).status,503);
 assert.equal(posts(f.calls).length,1);assert.equal(JSON.parse(f.calls.at(-1).body).p_outcome,'uncertain');
});
test('request body cannot switch production worker into Trial mode',async()=>{
 const f=await fixture({gate:{status:'blocked'}});
 await f.handler(new Request('https://worker',{method:'POST',headers:{Authorization:'Bearer service-secret'},body:JSON.stringify({mode:'trial'})}));
 assert.ok(f.calls[0].url.endsWith('/rpc/claim_pinterest_publish'));
});
