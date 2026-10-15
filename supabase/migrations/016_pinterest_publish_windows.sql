-- User-authorized US-market test windows; fixed Beijing times, independent of host timezone.
-- Preserve all existing per-shop, review, authorization and uncertain-attempt guards.
create function public.pinterest_publish_window_open(p_at timestamptz) returns boolean
language sql stable security invoker set search_path='' as $$
 select (p_at at time zone 'Asia/Shanghai')::time >= time '08:00'
    and (p_at at time zone 'Asia/Shanghai')::time < time '11:00'
     or (p_at at time zone 'Asia/Shanghai')::time >= time '21:00'
    and (p_at at time zone 'Asia/Shanghai')::time < time '23:00';
$$;
revoke all on function public.pinterest_publish_window_open(timestamptz) from public,anon,authenticated;
grant execute on function public.pinterest_publish_window_open(timestamptz) to service_role;

create or replace function public.claim_pinterest_publish() returns jsonb
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
 if not public.pinterest_publish_window_open(now()) then
 return jsonb_build_object('status','idle','reason','outside_publish_window'); end if;
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
 -- Different shops on one account must also be spaced by two hours.
 and not exists(select 1 from public.publish_history h where h.social_account_id=q.social_account_id and h.platform=q.platform
   and h.published_at>now()-interval '2 hours')
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

