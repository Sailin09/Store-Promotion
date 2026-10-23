import { readFileSync } from 'node:fs';
import { spawnSync } from 'node:child_process';

// Production-only: retain the existing service-role credential inside its own project Vault.
// Never expose SQL containing the credential, including on a failed psql invocation.
try {
 const token=process.env.SUPABASE_ACCESS_TOKEN;
 if(!token || !process.env.SUPABASE_DB_URL) throw new Error('configuration');
 const res=await fetch('https://api.supabase.com/v1/projects/czexstqnkogfvqyjvatr/api-keys?reveal=true',{
  headers:{Authorization:`Bearer ${token}`},signal:AbortSignal.timeout(15000)});
 if(!res.ok) throw new Error('credential lookup');
 const key=(await res.json()).find(k=>k.name==='service_role')?.api_key;
 if(typeof key!=='string'||key.length<20||!/^[A-Za-z0-9._-]+$/.test(key)) throw new Error('credential unavailable');
 console.log('::add-mask::'+key);
 const literal="'"+key.replaceAll("'","''")+"'";
 const setup=`begin;
 create extension if not exists pg_cron;
 create extension if not exists pg_net;
 create extension if not exists supabase_vault;
 revoke all on net.http_request_queue from public,anon,authenticated,service_role;
 do $$ declare secret_id uuid; begin
 select id into secret_id from vault.secrets where name='pinterest_scheduler_service_role';
 if secret_id is null then perform vault.create_secret(${literal},'pinterest_scheduler_service_role');
 else perform vault.update_secret(secret_id,${literal}); end if;
 end $$;
 ${readFileSync(new URL('./pinterest-scheduler.sql',import.meta.url),'utf8')}
 -- One guarded connectivity probe. The worker still enforces the real time window.
 insert into public.pinterest_scheduler_requests(request_id)
 select net.http_post(
  url:='https://czexstqnkogfvqyjvatr.supabase.co/functions/v1/pinterest-publisher',
  headers:=jsonb_build_object('Content-Type','application/json','Authorization','Bearer '||decrypted_secret,'x-publisher-key',decrypted_secret),
  body:='{}'::jsonb,timeout_milliseconds:=100000)
 from vault.decrypted_secrets where name='pinterest_scheduler_service_role';
 commit;`;
 const result=spawnSync('psql',['-X','-q','-v','ON_ERROR_STOP=1'],{
  input:setup,encoding:'utf8',env:{...process.env,PGDATABASE:process.env.SUPABASE_DB_URL},timeout:60000});
 if(result.status!==0) {
  console.error((result.stderr||'').replaceAll(key,'[REDACTED]').replaceAll(process.env.SUPABASE_DB_URL,'[REDACTED]').slice(-3000));
  throw new Error('scheduler installation');
 }
 console.log(JSON.stringify({scheduler:'installed',interval_minutes:5,window_guards:'unchanged'}));
} catch { console.error('Scheduler installation failed; inspect database extension availability and deployment configuration. No credentials logged.');process.exitCode=1; }
