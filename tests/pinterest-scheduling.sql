\set ON_ERROR_STOP on
-- Window boundaries use absolute instants, regardless of CI/session timezone or US DST.
begin;
set local timezone='America/Los_Angeles';
do $$
begin
 if public.pinterest_publish_window_open('2026-10-15 07:59:59+08')
 or not public.pinterest_publish_window_open('2026-10-15 08:00:00+08')
 or not public.pinterest_publish_window_open('2026-10-15 10:59:59+08')
 or public.pinterest_publish_window_open('2026-10-15 11:00:00+08')
 or public.pinterest_publish_window_open('2026-10-15 20:59:59+08')
 or not public.pinterest_publish_window_open('2026-10-15 21:00:00+08')
 or not public.pinterest_publish_window_open('2026-10-15 22:59:59+08')
 or public.pinterest_publish_window_open('2026-10-15 23:00:00+08')
 or not public.pinterest_publish_window_open('2026-12-15 08:00:00+08')
 then raise exception 'Beijing publication window boundary failed'; end if;
end $$;
rollback;

begin;
-- Simulate the wall clock at the narrow window helper only; keep real queue guards.
create or replace function public.pinterest_publish_window_open(p_at timestamptz) returns boolean
language sql stable security invoker set search_path='' as $$ select false; $$;
do $$
declare shop uuid; product uuid; account uuid; creative uuid; queue uuid; job jsonb;
        other_shop uuid; history_id uuid;
begin
 insert into shops(shop_code,shop_name,etsy_shop_url) values('SHOP-999','Publisher Test','https://www.etsy.com/shop/PublisherTest') returning id into shop;
 insert into products(shop_id,etsy_listing_id,etsy_url,title,listing_status) values(shop,'123','https://www.etsy.com/listing/123/item','Test','active') returning id into product;
 insert into social_accounts(platform,account_name,handle,account_status) values('pinterest','TEST','test_user','authorized_trial') returning id into account;
 update social_accounts set credential_reference='pinterest_oauth_credentials:'||account where id=account;
 insert into pinterest_oauth_credentials(social_account_id,pinterest_username,encrypted_tokens,scopes,access_expires_at) values(account,'test_user','cipher','pins:write',now()+interval '1 day');
 insert into shop_social_accounts(shop_id,social_account_id,platform) values(shop,account,'pinterest');
 insert into promotion_rules(shop_id,platform,rule_name) values(shop,'pinterest','default-organic');
 insert into content_variants(shop_id,product_id,platform,creative_id,image_url,title,body,destination_url,status) values(shop,product,'pinterest','test','https://i.etsystatic.com/a.jpg','Test','Description','https://www.etsy.com/listing/123/item','ready') returning id into creative;
 insert into publish_queue(shop_id,product_id,content_variant_id,platform,social_account_id,status) values(shop,product,creative,'pinterest',account,'ready') returning id into queue;
 insert into pinterest_publish_reviews(queue_id,board_id,snapshot,listing_checked_at,source_url) values(queue,'1234',pinterest_publish_snapshot(queue),now(),'https://www.etsy.com/listing/123/item');

 update pinterest_publish_settings set enabled=true,access_tier='standard',standard_verified_at=now(),approval_evidence='TEST ONLY';
 job:=claim_pinterest_publish();
 if job->>'reason' is distinct from 'outside_publish_window' then raise exception 'Closed window did not hold eligible queue: %',job; end if;
 if exists(select 1 from pinterest_publish_attempts where queue_id=queue) then raise exception 'Closed window created attempt'; end if;
 if (select status from publish_queue where id=queue)<>'ready' then raise exception 'Closed window mutated queue'; end if;
end $$;
-- Same account, another shop: the shop cap cannot mask the account-spacing test.
create or replace function public.pinterest_publish_window_open(p_at timestamptz) returns boolean
language sql stable security invoker set search_path='' as $$ select true; $$;
do $$
declare account uuid; other_shop uuid; other_product uuid; other_creative uuid; history_id uuid; job jsonb;
begin
 select id into account from social_accounts where handle='test_user';
 insert into shops(shop_code,shop_name,etsy_shop_url) values('SHOP-998','Other Test Shop','https://www.etsy.com/shop/OtherTest') returning id into other_shop;
 insert into products(shop_id,etsy_listing_id,etsy_url,title,listing_status) values(other_shop,'456','https://www.etsy.com/listing/456/item','Other','active') returning id into other_product;
 insert into content_variants(shop_id,product_id,platform,creative_id,title,body,destination_url,status) values(other_shop,other_product,'pinterest','other-test','Other','Other','https://www.etsy.com/listing/456/item','ready') returning id into other_creative;
 insert into publish_history(shop_id,product_id,content_variant_id,platform,social_account_id,published_at,external_post_id,external_url,publish_status)
 values(other_shop,other_product,other_creative,'pinterest',account,now()-interval '119 minutes','888888','https://www.pinterest.com/pin/888888/','published') returning id into history_id;
 if claim_pinterest_publish()->>'status'<>'idle' then raise exception 'Same-account different-shop spacing failed'; end if;
 update publish_history set published_at=now()-interval '2 hours' where id=history_id;
 job:=claim_pinterest_publish();
 if job->>'status'<>'claimed' then raise exception 'Exact two-hour boundary not released: %',job; end if;
 if claim_pinterest_publish()->>'status'<>'idle' then raise exception 'Concurrent reservation bypassed'; end if;
end $$;
rollback;
