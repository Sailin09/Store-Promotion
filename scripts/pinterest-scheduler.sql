-- Installed by the production deployment after provisioning Supabase extensions.
-- No secrets appear in cron.job or these source files.
create table if not exists public.pinterest_scheduler_requests (
 request_id bigint primary key,
 requested_at timestamptz not null default now(),
 completed_at timestamptz,
 http_status integer,
 outcome text,
 reason text
);
alter table public.pinterest_scheduler_requests enable row level security;
revoke all on public.pinterest_scheduler_requests from public, anon, authenticated, service_role;

create or replace function public.tick_pinterest_scheduler() returns bigint
language plpgsql security definer set search_path='' as $$
declare r record; response jsonb; credential text; request bigint;
begin
 perform pg_advisory_xact_lock(1617125,17);
 -- A cron SQL success only means HTTP was queued. Persist the actual safe outcome.
 for r in select s.request_id,n.status_code,n.content,n.timed_out
   from public.pinterest_scheduler_requests s join net._http_response n on n.id=s.request_id
   where s.completed_at is null loop
   begin response:=r.content::jsonb; exception when others then response:='{}'::jsonb; end;
   update public.pinterest_scheduler_requests set completed_at=now(),http_status=r.status_code,
     outcome=case when r.timed_out then 'transport_timeout' else coalesce(response->>'status','http_error') end,
     reason=left(coalesce(response->>'reason',response->>'error'),100)
   where request_id=r.request_id;
 end loop;
 update public.pinterest_scheduler_requests set completed_at=now(),outcome='response_missing'
 where completed_at is null and requested_at<now()-interval '10 minutes';
 if not public.pinterest_publish_window_open(now()) or not exists
   (select 1 from public.pinterest_publish_settings where enabled and access_tier='standard') then return null; end if;
 if exists(select 1 from public.pinterest_scheduler_requests where completed_at is null) then return null; end if;
 select decrypted_secret into strict credential from vault.decrypted_secrets where name='pinterest_scheduler_service_role';
 if credential is null or length(credential)<20 then raise exception 'Scheduler credential missing'; end if;
 select net.http_post(
   url:='https://czexstqnkogfvqyjvatr.supabase.co/functions/v1/pinterest-publisher',
   headers:=jsonb_build_object('Content-Type','application/json','Authorization','Bearer '||credential,'x-publisher-key',credential),
   body:='{}'::jsonb,timeout_milliseconds:=100000) into request;
 insert into public.pinterest_scheduler_requests(request_id) values(request);
 return request;
end $$;
revoke all on function public.tick_pinterest_scheduler() from public, anon, authenticated, service_role;
select cron.schedule('store-promotion-pinterest','*/5 * * * *','select public.tick_pinterest_scheduler();');
