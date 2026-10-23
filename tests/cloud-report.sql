\set ON_ERROR_STOP on
begin;
create schema cron;
create table cron.job(jobname text primary key,schedule text,active boolean default true);
create function cron.schedule(job_name text,cron_expression text,sql_command text) returns bigint language plpgsql as $$
begin insert into cron.job(jobname,schedule) values(job_name,cron_expression) on conflict(jobname) do update set schedule=excluded.schedule;return 1;end $$;
create table public.pinterest_scheduler_requests(request_id bigint,requested_at timestamptz,completed_at timestamptz,http_status integer,outcome text,reason text);
\ir ../scripts/cloud-publication-report.sql
\ir ../scripts/cloud-publication-report.sql
do $$ declare r jsonb; begin
 r:=public.pinterest_cloud_report();
 if jsonb_array_length(r->'accounts')<>5 then raise exception 'Missing account coverage'; end if;
 if (select count(*) from cron.job)<>1 then raise exception 'Duplicate snapshot schedule'; end if;
 if has_function_privilege('anon','public.pinterest_cloud_report()','EXECUTE') or has_function_privilege('service_role','public.capture_pinterest_evening_report()','EXECUTE') then raise exception 'Report privilege leak'; end if;
 perform public.capture_pinterest_evening_report();
 perform public.capture_pinterest_evening_report();
 if (select count(*) from public.pinterest_cloud_reports)>1 then raise exception 'Duplicate snapshot'; end if;
 if now()<'2026-10-23T13:35:00Z' and exists(select 1 from public.pinterest_cloud_reports) then raise exception 'Premature snapshot'; end if;
end $$;
rollback;
