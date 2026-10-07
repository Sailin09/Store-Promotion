-- Disabled until a human-verifiable Standard approval is recorded. No draft activation.
create table public.pinterest_publish_settings (
  singleton boolean primary key default true check(singleton),
  enabled boolean not null default false,
  access_tier text not null default 'trial' check(access_tier in ('trial','standard')),
  standard_verified_at timestamptz,
  approval_evidence text
);
insert into public.pinterest_publish_settings(singleton) values(true);
-- Snapshot approval binds the exact creative, product, account and board together.
create table public.pinterest_publish_reviews (
  queue_id uuid primary key references public.publish_queue(id),
  board_id text not null check(board_id ~ '^[0-9]+$'),
  snapshot jsonb not null,
  reviewed_at timestamptz not null default now(),
  listing_checked_at timestamptz not null,
  source_url text not null
);
create table public.pinterest_publish_attempts (
  queue_id uuid primary key references public.publish_queue(id),
  attempt_id uuid not null unique default gen_random_uuid(),
  state text not null check(state in ('prepared','dispatched','published','failed','uncertain')),
  snapshot jsonb not null,
  board_id text not null,
  started_at timestamptz not null default now(),
  dispatched_at timestamptz,
  finished_at timestamptz,
  pin_id text,
  error_code text
);
create unique index pinterest_attempt_pin_unique on public.pinterest_publish_attempts(pin_id) where pin_id is not null;
alter table public.pinterest_publish_settings enable row level security;
alter table public.pinterest_publish_reviews enable row level security;
alter table public.pinterest_publish_attempts enable row level security;
revoke all on public.pinterest_publish_settings,public.pinterest_publish_reviews,public.pinterest_publish_attempts from public,anon,authenticated;
grant select,insert,update on public.pinterest_publish_settings,public.pinterest_publish_reviews,public.pinterest_publish_attempts to service_role;
grant select on public.products,public.shops,public.content_variants,public.shop_social_accounts,public.promotion_rules,public.publish_history to service_role;
grant select,update on public.publish_queue to service_role;
grant insert on public.publish_history to service_role;

create function public.pinterest_publish_snapshot(p_queue uuid) returns jsonb
language sql stable security invoker set search_path='' as $$
 select jsonb_build_object('queue_id',q.id,'shop_id',q.shop_id,'product_id',q.product_id,
 'content_variant_id',q.content_variant_id,'account_id',q.social_account_id,
 'handle',a.handle,'listing_id',p.etsy_listing_id,'link',cv.destination_url,
 'image_url',cv.image_url,'title',cv.title,'description',cv.body,'category',cv.board_or_category)
 from public.publish_queue q join public.content_variants cv on cv.id=q.content_variant_id
 join public.products p on p.id=q.product_id join public.social_accounts a on a.id=q.social_account_id
 where q.id=p_queue and cv.product_id=p.id and cv.shop_id=q.shop_id and p.shop_id=q.shop_id
 and cv.platform='pinterest' and q.platform='pinterest';
$$;

create function public.claim_pinterest_publish() returns jsonb
language plpgsql security invoker set search_path='' as $$
declare selected public.publish_queue; review public.pinterest_publish_reviews; attempt uuid;
begin
 -- Serializes all claims across workers, accounts and shops. An in-flight job reserves both.
 perform pg_advisory_xact_lock(1617125,13);
 -- A crashed worker can never silently become a retry. Retain reservation until reconciled.
 update public.pinterest_publish_attempts set state='uncertain',error_code='worker_interrupted'
 where state in ('prepared','dispatched') and started_at < now()-interval '15 minutes';
 if not exists(select 1 from public.pinterest_publish_settings where enabled and access_tier='standard'
 and standard_verified_at is not null and length(trim(approval_evidence))>0) then
 return jsonb_build_object('status','blocked','reason','standard_access_or_activation_required'); end if;
 select q.* into selected from public.publish_queue q
 join public.products p on p.id=q.product_id and p.shop_id=q.shop_id
 join public.shops s on s.id=q.shop_id and s.status='active'
 join public.content_variants cv on cv.id=q.content_variant_id and cv.product_id=p.id and cv.shop_id=s.id and cv.platform='pinterest'
 join public.social_accounts a on a.id=q.social_account_id and a.platform='pinterest' and a.active
 join public.pinterest_oauth_credentials cred on cred.social_account_id=a.id and lower(cred.pinterest_username)=lower(a.handle)
 join public.pinterest_publish_reviews rev on rev.queue_id=q.id
 join public.promotion_rules rule on rule.shop_id=q.shop_id and rule.platform=q.platform and rule.rule_name='default-organic'
 where q.platform='pinterest' and q.status in ('ready','scheduled') and coalesce(q.scheduled_at,now())<=now()
 and cv.status='ready' and p.listing_status='active' and rule.enabled
 and rule.max_posts_per_day>0 and rule.min_gap_hours>=0 and rule.evergreen_reuse_days>=0
 and a.credential_reference='pinterest_oauth_credentials:'||a.id::text
 and a.account_status in ('authorized_trial','authorized_standard')
 and exists(select 1 from public.shop_social_accounts m where m.shop_id=q.shop_id and m.social_account_id=a.id and m.platform=q.platform and m.active)
 and rev.snapshot=public.pinterest_publish_snapshot(q.id) and rev.source_url=p.etsy_url
 and rev.listing_checked_at between now()-interval '30 days' and now()
 and rev.reviewed_at between now()-interval '30 days' and now()
 and not exists(select 1 from public.pinterest_publish_attempts pa where pa.queue_id=q.id)
 and not exists(select 1 from public.publish_history h where h.content_variant_id=cv.id)
 and not exists(select 1 from public.pinterest_publish_attempts pa join public.publish_queue busy on busy.id=pa.queue_id
   where pa.state in ('prepared','dispatched','uncertain') and (busy.shop_id=q.shop_id or busy.social_account_id=q.social_account_id))
 and not exists(select 1 from public.publish_history h where h.shop_id=q.shop_id and h.platform=q.platform
   and h.published_at>now()-make_interval(hours=>rule.min_gap_hours))
 and (select count(*) from public.publish_history h where h.shop_id=q.shop_id and h.platform=q.platform
   and h.published_at>now()-interval '24 hours') < rule.max_posts_per_day
 and not exists(select 1 from public.publish_history h where h.product_id=q.product_id and h.platform=q.platform
   and h.published_at>now()-make_interval(days=>rule.evergreen_reuse_days))
 order by q.priority,q.created_at for update of q skip locked limit 1;
 if selected.id is null then return jsonb_build_object('status','idle'); end if;
 select * into review from public.pinterest_publish_reviews where queue_id=selected.id;
 insert into public.pinterest_publish_attempts(queue_id,state,snapshot,board_id)
 values(selected.id,'prepared',review.snapshot,review.board_id) returning attempt_id into attempt;
 update public.publish_queue set status='publishing',updated_at=now(),last_error=null where id=selected.id;
 return jsonb_build_object('status','claimed','attempt_id',attempt,'board_id',review.board_id,'snapshot',review.snapshot);
end; $$;

create function public.dispatch_pinterest_publish(p_attempt uuid) returns boolean
language plpgsql security invoker set search_path='' as $$
declare a public.pinterest_publish_attempts; q public.publish_queue;
begin
 select * into a from public.pinterest_publish_attempts where attempt_id=p_attempt for update;
 if a.state is distinct from 'prepared' or a.started_at<now()-interval '10 minutes' then return false; end if;
 select * into q from public.publish_queue where id=a.queue_id for update;
 if q.status<>'publishing' or a.snapshot is distinct from public.pinterest_publish_snapshot(q.id)
 or not exists(select 1 from public.pinterest_publish_settings where enabled and access_tier='standard' and standard_verified_at is not null and length(trim(approval_evidence))>0)
 or not exists(select 1 from public.shops where id=q.shop_id and status='active')
 or not exists(select 1 from public.products where id=q.product_id and listing_status='active')
 or not exists(select 1 from public.social_accounts where id=q.social_account_id and active)
 or not exists(select 1 from public.shop_social_accounts where shop_id=q.shop_id and social_account_id=q.social_account_id and platform='pinterest' and active)
 or not exists(select 1 from public.promotion_rules where shop_id=q.shop_id and platform='pinterest' and rule_name='default-organic' and enabled)
 then return false; end if;
 update public.pinterest_publish_attempts set state='dispatched',dispatched_at=now() where attempt_id=p_attempt;
 return true;
end; $$;

create function public.finish_pinterest_publish(p_attempt uuid,p_outcome text,p_pin_id text default null,p_error text default null) returns void
language plpgsql security invoker set search_path='' as $$
declare a public.pinterest_publish_attempts; q public.publish_queue;
begin
 select * into a from public.pinterest_publish_attempts where attempt_id=p_attempt for update;
 if a.attempt_id is null then raise exception 'Unknown attempt'; end if;
 if a.state='published' then
   if p_outcome='published' and a.pin_id=p_pin_id then return; end if;
   raise exception 'Already finalized'; end if;
 select * into q from public.publish_queue where id=a.queue_id for update;
 if p_outcome='published' then
   if a.dispatched_at is null or p_pin_id is null or p_pin_id!~'^[0-9]+$' then raise exception 'Invalid success'; end if;
   insert into public.publish_history(shop_id,product_id,content_variant_id,platform,social_account_id,published_at,external_post_id,external_url,publish_status)
   values(q.shop_id,q.product_id,q.content_variant_id,'pinterest',q.social_account_id,a.dispatched_at,p_pin_id,'https://www.pinterest.com/pin/'||p_pin_id||'/','published');
   update public.publish_queue set status='published',last_error=null,updated_at=now() where id=q.id;
 elsif p_outcome in ('failed','uncertain') then
   -- Even definite rejections require inspection. No automatic replay after POST.
   if a.dispatched_at is not null then p_outcome:='uncertain'; end if;
   update public.publish_queue set status='paused',last_error=left(coalesce(p_error,'inspection_required'),80),retry_count=retry_count+1,updated_at=now() where id=q.id;
 else raise exception 'Invalid outcome'; end if;
 update public.pinterest_publish_attempts set state=p_outcome,pin_id=p_pin_id,error_code=left(p_error,80),finished_at=now() where attempt_id=p_attempt;
end; $$;

create function public.refresh_pinterest_credential(p_account uuid,p_old text,p_new text,p_scopes text,p_expires timestamptz) returns boolean
language plpgsql security invoker set search_path='' as $$
begin
 update public.pinterest_oauth_credentials set encrypted_tokens=p_new,scopes=p_scopes,access_expires_at=p_expires
 where social_account_id=p_account and encrypted_tokens=p_old;
 return found;
end; $$;

revoke all on function public.pinterest_publish_snapshot(uuid),public.claim_pinterest_publish(),public.dispatch_pinterest_publish(uuid),public.finish_pinterest_publish(uuid,text,text,text),public.refresh_pinterest_credential(uuid,text,text,text,timestamptz) from public,anon,authenticated;
grant execute on function public.pinterest_publish_snapshot(uuid),public.claim_pinterest_publish(),public.dispatch_pinterest_publish(uuid),public.finish_pinterest_publish(uuid,text,text,text),public.refresh_pinterest_credential(uuid,text,text,text,timestamptz) to service_role;
