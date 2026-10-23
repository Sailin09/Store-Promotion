\set ON_ERROR_STOP on
begin;
-- Disposable PostgreSQL substitutes extension APIs; production uses Supabase extensions.
create schema net;
create schema vault;
create schema cron;
create table vault.decrypted_secrets(name text,decrypted_secret text);
insert into vault.decrypted_secrets values('pinterest_scheduler_service_role','test-only-credential-not-real');
create table net._http_response(id bigint,status_code int,content text,timed_out boolean);
create table net.test_requests(id bigserial,url text,body jsonb,headers jsonb,timeout_ms int);
create function net.http_post(url text,body jsonb default '{}'::jsonb,params jsonb default '{}'::jsonb,headers jsonb default '{}'::jsonb,timeout_milliseconds int default 1000) returns bigint
language sql as $$ insert into net.test_requests(url,body,headers,timeout_ms) values(url,body,headers,timeout_milliseconds) returning id; $$;
create table cron.test_jobs(name text primary key,schedule text,command text);
create function cron.schedule(job_name text,cron_expression text,sql_command text) returns bigint language plpgsql as $$
begin insert into cron.test_jobs values(job_name,cron_expression,sql_command)
on conflict(name) do update set schedule=excluded.schedule,command=excluded.command;return 1;end $$;
\ir ../scripts/pinterest-scheduler.sql
\ir ../scripts/pinterest-scheduler.sql
create or replace function public.pinterest_publish_window_open(p_at timestamptz) returns boolean language sql as $$ select false; $$;
do $$ begin
 update pinterest_publish_settings set enabled=true,access_tier='standard';
 if tick_pinterest_scheduler() is not null or exists(select 1 from net.test_requests) then raise exception 'Closed window dispatched'; end if;
 if (select count(*) from cron.test_jobs)<>1 then raise exception 'Duplicate cron jobs'; end if;
 if has_function_privilege('anon','public.tick_pinterest_scheduler()','EXECUTE')
 or has_function_privilege('service_role','public.tick_pinterest_scheduler()','EXECUTE')
 then raise exception 'Scheduler privilege leak'; end if;
end $$;
create or replace function public.pinterest_publish_window_open(p_at timestamptz) returns boolean language sql as $$ select true; $$;
do $$ declare request bigint; begin
 update pinterest_publish_settings set enabled=false;
 if tick_pinterest_scheduler() is not null then raise exception 'Disabled dispatched'; end if;
 update pinterest_publish_settings set enabled=true;
 request:=tick_pinterest_scheduler();
 if request is null then raise exception 'Open window did not dispatch'; end if;
 if tick_pinterest_scheduler() is not null then raise exception 'Pending request duplicated'; end if;
 if (select url from net.test_requests where id=request)<>'https://czexstqnkogfvqyjvatr.supabase.co/functions/v1/pinterest-publisher'
 then raise exception 'Wrong endpoint'; end if;
 insert into net._http_response values(request,200,'{"status":"published"}',false);
 perform tick_pinterest_scheduler();
 if not exists(select 1 from pinterest_scheduler_requests where request_id=request and outcome='published' and completed_at is not null)
 then raise exception 'HTTP outcome not recorded'; end if;
 update pinterest_scheduler_requests set requested_at=now()-interval '11 minutes' where completed_at is null;
 perform tick_pinterest_scheduler();
 if not exists(select 1 from pinterest_scheduler_requests where outcome='response_missing') then raise exception 'Missing response not detected'; end if;
end $$;
rollback;
