\set ON_ERROR_STOP on
begin;
create function pg_temp.expect_replenishment_failure(items jsonb, message text) returns void language plpgsql as $$
begin
 begin perform public.replenish_verified_products(items,'test-batch');
 exception when others then
   if sqlerrm not like message||'%' then raise; end if;
   return;
 end;
 raise exception 'Expected failure: %',message;
end $$;
do $$
declare shop uuid; account uuid; items jsonb; bad jsonb; result jsonb; n integer;
begin
 insert into shops(shop_code,shop_name,etsy_shop_url) values('SHOP-990','Replenishment Test','https://www.etsy.com/shop/ReplenishmentTest') returning id into shop;
 insert into social_accounts(platform,account_name,handle,account_status) values('pinterest','REPLENISH_TEST','replenish_test','authorized_standard') returning id into account;
 insert into shop_social_accounts(shop_id,social_account_id,platform) values(shop,account,'pinterest');
 insert into pinterest_oauth_credentials(social_account_id,pinterest_username,encrypted_tokens,scopes,access_expires_at)
 values(account,'replenish_test','test-only','pins:write',now()+interval '1 day');
 update pinterest_publish_settings set enabled=true,access_tier='standard',standard_verified_at=now(),approval_evidence='TEST ONLY';
 select jsonb_agg(jsonb_build_object('shop','Replenishment Test','handle','replenish_test','listing_id',(990000+i)::text,
   'source_url','https://www.etsy.com/listing/'||(990000+i)||'/test','image_url','https://i.etsystatic.com/test.jpg',
   'new_title','Test product','body','Reviewed description','category','Test category','board_id','1234',
   'checked_at',now(),'available',true,'visual_verified',true)) into items from generate_series(1,6) i;
 result:=replenish_verified_products(items,'test-batch');
 if result->>'inserted'<>'6' then raise exception 'Multi-item batch failed: %',result; end if;
 if (select count(*) from publish_queue where shop_id=shop and status='ready')<>6
 or (select count(*) from pinterest_publish_reviews r join publish_queue q on q.id=r.queue_id where q.shop_id=shop and r.snapshot=pinterest_publish_snapshot(q.id))<>6
 then raise exception 'Missing exact ready reviews'; end if;
 result:=replenish_verified_products(items,'test-batch');
 if result->>'inserted'<>'0' or result->>'skipped_existing'<>'6' then raise exception 'Retry duplicated items'; end if;
 -- Even a later retry cannot renew existing evidence.
 bad:=jsonb_set(items,'{0,checked_at}',to_jsonb(now()-interval '2 days'));
 result:=replenish_verified_products(bad,'test-batch');
 if result->>'inserted'<>'0' then raise exception 'Expired retry changed stock'; end if;
 bad:=jsonb_set(jsonb_set(items->0,'{listing_id}','"990099"'),'{source_url}','"https://www.etsy.com/listing/990099/test"');
 perform pg_temp.expect_replenishment_failure(jsonb_build_array(jsonb_set(bad,'{checked_at}',to_jsonb(now()-interval '25 hours'))),'Verification expired');
 perform pg_temp.expect_replenishment_failure(jsonb_build_array(bad,bad),'Duplicate');
 perform pg_temp.expect_replenishment_failure(jsonb_build_array(jsonb_set(bad,'{checked_at}','null')),'Verification expired');
 perform pg_temp.expect_replenishment_failure(jsonb_build_array(jsonb_set(bad,'{visual_verified}','false')),'Verification expired');
 perform pg_temp.expect_replenishment_failure(jsonb_build_array(jsonb_set(bad,'{handle}','"wrong_account"')),'Batch routing');
 -- A bad second item must roll back the valid first item too.
 perform pg_temp.expect_replenishment_failure(jsonb_build_array(bad,jsonb_set(jsonb_set(bad,'{listing_id}','"990098"'),'{source_url}','"https://evil.invalid/"')),'Invalid source');
 if exists(select 1 from products where etsy_listing_id='990099') then raise exception 'Partial batch committed'; end if;
 if has_function_privilege('anon','public.replenish_verified_products(jsonb,text)','EXECUTE')
 or has_function_privilege('service_role','public.replenish_verified_products(jsonb,text)','EXECUTE') then raise exception 'Administrative ingestion exposed'; end if;
end $$;
rollback;
