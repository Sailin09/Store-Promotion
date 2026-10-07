\set ON_ERROR_STOP on
begin;
-- Uses a disposable PostgreSQL database only. All fixture writes roll back.
do $$
declare shop uuid; product uuid; account uuid; creative uuid; queue uuid; job jsonb; a uuid;
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
 if claim_pinterest_publish()->>'status'<>'blocked' then raise exception 'Trial gate failed'; end if;
 update pinterest_publish_settings set enabled=true,access_tier='standard',standard_verified_at=now(),approval_evidence='TEST ONLY';
 update content_variants set title='Modified after review' where id=creative;
 if claim_pinterest_publish()->>'status'<>'idle' then raise exception 'Stale approval allowed'; end if;
 update content_variants set title='Test' where id=creative;
 update shops set status='paused' where id=shop;
 if claim_pinterest_publish()->>'status'<>'idle' then raise exception 'Paused shop allowed'; end if;
 update shops set status='active' where id=shop;
 job:=claim_pinterest_publish();
 if job->>'status'<>'claimed' then raise exception 'Eligible task not claimed: %',job; end if;
 a:=(job->>'attempt_id')::uuid;
 if claim_pinterest_publish()->>'status'<>'idle' then raise exception 'Claim repeated'; end if;
 if not dispatch_pinterest_publish(a) then raise exception 'Dispatch failed'; end if;
 if dispatch_pinterest_publish(a) then raise exception 'Dispatch repeated'; end if;
 perform finish_pinterest_publish(a,'published','999999');
 perform finish_pinterest_publish(a,'published','999999');
 if (select count(*) from publish_history where content_variant_id=creative)<>1 then raise exception 'History duplicate'; end if;
 -- A different creative for the same product is held by both daily and evergreen limits.
 insert into content_variants(shop_id,product_id,platform,creative_id,image_url,title,body,destination_url,status) values(shop,product,'pinterest','test2','https://i.etsystatic.com/a.jpg','Test2','Description','https://www.etsy.com/listing/123/item','ready') returning id into creative;
 insert into publish_queue(shop_id,product_id,content_variant_id,platform,social_account_id,status) values(shop,product,creative,'pinterest',account,'ready') returning id into queue;
 insert into pinterest_publish_reviews(queue_id,board_id,snapshot,listing_checked_at,source_url) values(queue,'1234',pinterest_publish_snapshot(queue),now(),'https://www.etsy.com/listing/123/item');
 if claim_pinterest_publish()->>'status'<>'idle' then raise exception 'Frequency limit failed'; end if;
 update publish_history set published_at=now()-interval '46 days' where shop_id=shop;
 job:=claim_pinterest_publish(); a:=(job->>'attempt_id')::uuid;
 if job->>'status'<>'claimed' then raise exception 'Evergreen delay not released'; end if;
 if not dispatch_pinterest_publish(a) then raise exception 'Dispatch failed'; end if;
 perform finish_pinterest_publish(a,'uncertain',null,'timeout');
 update publish_queue set status='ready' where id=queue;
 if claim_pinterest_publish()->>'status'<>'idle' then raise exception 'Uncertain job replayed'; end if;
 if has_function_privilege('anon','public.claim_pinterest_publish()','execute') then raise exception 'Anonymous execution permitted'; end if;
 if not has_function_privilege('service_role','public.claim_pinterest_publish()','execute') then raise exception 'Worker RPC missing grant'; end if;
end $$;
rollback;
