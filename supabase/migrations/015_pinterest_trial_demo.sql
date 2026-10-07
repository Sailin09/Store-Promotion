-- One manually reviewed demo for this app. Never consumes/activates production queue.
create table public.pinterest_trial_demo (
 singleton boolean primary key default true check(singleton),
 attempt_id uuid not null unique default gen_random_uuid(),
 queue_id uuid not null references public.publish_queue(id),
 snapshot jsonb not null,
 board_id text not null check(board_id ~ '^[0-9]+$'),
 reviewed_at timestamptz not null default now(),
 state text not null default 'approved' check(state in ('approved','prepared','dispatched','published','failed','uncertain')),
 started_at timestamptz,
 dispatched_at timestamptz,
 finished_at timestamptz,
 pin_id text,
 error_code text
);
alter table public.pinterest_trial_demo enable row level security;
revoke all on public.pinterest_trial_demo from public,anon,authenticated;
grant select,insert,update on public.pinterest_trial_demo to service_role;

create function public.pinterest_trial_demo_valid(p_queue uuid,p_snapshot jsonb) returns boolean
language sql stable security invoker set search_path='' as $$
 select p_snapshot=public.pinterest_publish_snapshot(p_queue) and exists(
 select 1 from public.publish_queue q
 join public.products p on p.id=q.product_id
 join public.shops s on s.id=q.shop_id
 join public.social_accounts a on a.id=q.social_account_id
 join public.pinterest_oauth_credentials c on c.social_account_id=a.id
 where q.id=p_queue and q.platform='pinterest' and q.status='draft'
 and lower(a.handle)='sailing_981' and a.active and a.platform='pinterest'
 and lower(c.pinterest_username)=lower(a.handle)
 and a.credential_reference='pinterest_oauth_credentials:'||a.id::text
 and a.account_status in ('authorized_trial','authorized_standard')
 and s.status='active' and p.listing_status='active'
 and exists(select 1 from public.shop_social_accounts m where m.shop_id=q.shop_id
 and m.social_account_id=q.social_account_id and m.platform='pinterest' and m.active)
 and not exists(select 1 from public.publish_history h where h.content_variant_id=q.content_variant_id)
 and not exists(select 1 from public.pinterest_publish_attempts x where x.queue_id=q.id)
 ) and exists(select 1 from public.pinterest_publish_settings where not enabled and access_tier='trial');
$$;

create function public.claim_pinterest_publish_trial() returns jsonb
language plpgsql security invoker set search_path='' as $$
declare d public.pinterest_trial_demo;
begin
 perform pg_advisory_xact_lock(1617125,15);
 select * into d from public.pinterest_trial_demo where singleton for update;
 if d.attempt_id is null then return jsonb_build_object('status','blocked','reason','reviewed_trial_demo_required'); end if;
 if d.state<>'approved' then return jsonb_build_object('status','blocked','reason','trial_demo_already_attempted','pin_id',d.pin_id); end if;
 if d.reviewed_at not between now()-interval '1 day' and now()
 or public.pinterest_trial_demo_valid(d.queue_id,d.snapshot) is not true
 then return jsonb_build_object('status','blocked','reason','trial_review_invalid'); end if;
 update public.pinterest_trial_demo set state='prepared',started_at=now() where singleton;
 return jsonb_build_object('status','claimed','attempt_id',d.attempt_id,'board_id',d.board_id,'snapshot',d.snapshot);
end; $$;

create function public.dispatch_pinterest_publish_trial(p_attempt uuid) returns boolean
language plpgsql security invoker set search_path='' as $$
declare d public.pinterest_trial_demo;
begin
 select * into d from public.pinterest_trial_demo where attempt_id=p_attempt for update;
 if d.state is distinct from 'prepared' or d.started_at<now()-interval '10 minutes'
 or d.reviewed_at<now()-interval '1 day'
 or public.pinterest_trial_demo_valid(d.queue_id,d.snapshot) is not true then return false; end if;
 update public.pinterest_trial_demo set state='dispatched',dispatched_at=now() where singleton;
 return true;
end; $$;

create function public.finish_pinterest_publish_trial(p_attempt uuid,p_outcome text,p_pin_id text default null,p_error text default null) returns void
language plpgsql security invoker set search_path='' as $$
declare d public.pinterest_trial_demo;
begin
 select * into d from public.pinterest_trial_demo where attempt_id=p_attempt for update;
 if d.attempt_id is null then raise exception 'Unknown demo'; end if;
 if d.state='published' then
 if p_outcome='published' and p_pin_id=d.pin_id then return; end if;
 raise exception 'Already finalized'; end if;
 if p_outcome='published' then
 if d.dispatched_at is null or p_pin_id is null or p_pin_id!~'^[0-9]+$' then raise exception 'Invalid success'; end if;
 elsif p_outcome in ('failed','uncertain') then
 if d.dispatched_at is not null then p_outcome:='uncertain'; end if;
 else raise exception 'Invalid outcome'; end if;
 update public.pinterest_trial_demo set state=p_outcome,pin_id=p_pin_id,error_code=left(p_error,80),finished_at=now() where singleton;
end; $$;
revoke all on function public.pinterest_trial_demo_valid(uuid,jsonb),public.claim_pinterest_publish_trial(),public.dispatch_pinterest_publish_trial(uuid),public.finish_pinterest_publish_trial(uuid,text,text,text) from public,anon,authenticated;
grant execute on function public.pinterest_trial_demo_valid(uuid,jsonb),public.claim_pinterest_publish_trial(),public.dispatch_pinterest_publish_trial(uuid),public.finish_pinterest_publish_trial(uuid,text,text,text) to service_role;
