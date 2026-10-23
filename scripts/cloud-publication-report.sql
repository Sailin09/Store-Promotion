-- Snapshot evidence in Supabase at the requested time, independent of Actions delays.
create table if not exists public.pinterest_cloud_reports (
 report_key text primary key, captured_at timestamptz not null default now(), report jsonb not null
);
alter table public.pinterest_cloud_reports enable row level security;
revoke all on public.pinterest_cloud_reports from public,anon,authenticated,service_role;

create or replace function public.pinterest_cloud_report() returns jsonb
language sql stable security definer set search_path='' as $$
select jsonb_build_object('captured_at',now(),'baseline_at','2026-10-23T06:45:08Z','baseline_total',62,
 'accounts',(select jsonb_agg(x order by x->>'account') from (
 select jsonb_build_object('account',a.account_name,'handle',a.handle,
 'baseline',case a.handle when 'icyndizhang' then 18 when 'sailing_981' then 17 when 'mydecorshop' then 10 when 'cindyzhang62' then 7 when 'ivy5205' then 10 end,
 'total',(select count(*) from public.publish_history h where h.social_account_id=a.id and h.platform='pinterest' and h.publish_status='published'),
 'last_publish',(select max(h.published_at) from public.publish_history h where h.social_account_id=a.id and h.platform='pinterest' and h.publish_status='published'),
 'ready',(select count(*) from public.publish_queue q where q.social_account_id=a.id and q.platform='pinterest' and q.status in ('ready','scheduled')),
 'pins',(select coalesce(jsonb_agg(jsonb_build_object('pin_id',h.external_post_id,'url',h.external_url,'shop',s.shop_name,'listing_id',p.etsy_listing_id,'published_at',h.published_at) order by h.published_at),'[]'::jsonb)
 from public.publish_history h join public.shops s on s.id=h.shop_id join public.products p on p.id=h.product_id
 where h.social_account_id=a.id and h.platform='pinterest' and h.publish_status='published' and h.published_at>'2026-10-23T06:45:08Z'::timestamptz),
 'attempts',(select coalesce(jsonb_agg(jsonb_build_object('queue_id',pa.queue_id,'state',pa.state,'error',pa.error_code,'started_at',pa.started_at)),'[]'::jsonb)
 from public.pinterest_publish_attempts pa join public.publish_queue q on q.id=pa.queue_id
 where q.social_account_id=a.id and pa.state<>'published' and (pa.started_at>'2026-10-23T06:45:08Z'::timestamptz or pa.state in ('prepared','dispatched','uncertain')))) as x
 from public.social_accounts a where a.platform='pinterest' and a.active) accounts),
 'requests',(select coalesce(jsonb_agg(x),'[]'::jsonb) from (select request_id,requested_at,completed_at,http_status,outcome,reason from public.pinterest_scheduler_requests order by requested_at desc limit 20) x),
 'scheduler',(select coalesce(jsonb_agg(jsonb_build_object('name',jobname,'schedule',schedule,'active',active)),'[]'::jsonb) from cron.job where jobname='store-promotion-pinterest'));
$$;
revoke all on function public.pinterest_cloud_report() from public,anon,authenticated,service_role;

create or replace function public.capture_pinterest_evening_report() returns void
language plpgsql security definer set search_path='' as $$
begin
 if now()>='2026-10-23T13:35:00Z'::timestamptz and now()<'2026-10-24T00:00:00Z'::timestamptz then
 insert into public.pinterest_cloud_reports(report_key,report) values('2026-10-23-evening',public.pinterest_cloud_report())
 on conflict(report_key) do nothing;
 end if;
end $$;
revoke all on function public.capture_pinterest_evening_report() from public,anon,authenticated,service_role;
select cron.schedule('store-promotion-evening-report-20261023','35 13 23 10 *','select public.capture_pinterest_evening_report();');
