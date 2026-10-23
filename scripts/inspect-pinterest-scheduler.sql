\set ON_ERROR_STOP on
select json_build_object('scheduler',jobname,'schedule',schedule,'active',active) from cron.job where jobname='store-promotion-pinterest';
select json_build_object('cron_run',runid,'status',status,'started_at',start_time,'ended_at',end_time)
from cron.job_run_details where jobid in(select jobid from cron.job where jobname='store-promotion-pinterest') order by runid desc limit 10;
select json_build_object('http_request',request_id,'requested_at',requested_at,'completed_at',completed_at,'http_status',http_status,'outcome',outcome,'reason',reason)
from public.pinterest_scheduler_requests order by requested_at desc limit 20;
select json_build_object('account',a.account_name,'last_publish',max(h.published_at),'published',count(h.id))
from social_accounts a left join publish_history h on h.social_account_id=a.id and h.platform='pinterest' and h.publish_status='published'
where a.platform='pinterest' group by a.id order by a.account_name;
-- Make a green workflow meaningful: report prolonged inactivity while stock remains.
do $$ begin
 if exists(select 1 from pinterest_publish_settings where enabled and access_tier='standard')
 and exists(select 1 from publish_queue where platform='pinterest' and status in ('ready','scheduled'))
 and not exists(select 1 from publish_history where platform='pinterest' and publish_status='published' and published_at>now()-interval '26 hours')
 then raise warning 'PUBLISHING_STALE: stock exists but no successful Pinterest publication in 26 hours'; end if;
end $$;
