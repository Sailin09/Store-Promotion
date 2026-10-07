begin;
do $$
declare shop uuid; product uuid; account uuid; creative uuid; queue uuid; job jsonb; a uuid;
begin
 insert into shops(shop_code,shop_name,etsy_shop_url) values('SHOP-998','Publisher Test','https://www.etsy.com/shop/PublisherTest') returning id into shop;
 insert into products(shop_id,etsy_listing_id,etsy_url,title,listing_status) values(shop,'123','https://www.etsy.com/listing/123/item','Test','active') returning id into product;
 select id into account from social_accounts where platform='pinterest' and handle='sailing_981';
 if account is null then insert into social_accounts(platform,account_name,handle,account_status) values('pinterest','TEST','sailing_981','authorized_trial') returning id into account; end if;
 update social_accounts set account_status='authorized_trial',active=true where id=account;
 update social_accounts set credential_reference='pinterest_oauth_credentials:'||account where id=account;
 insert into pinterest_oauth_credentials(social_account_id,pinterest_username,encrypted_tokens,scopes,access_expires_at) values(account,'sailing_981','cipher','pins:write',now()+interval '1 day') on conflict (social_account_id) do update set pinterest_username='sailing_981';
 insert into shop_social_accounts(shop_id,social_account_id,platform) values(shop,account,'pinterest');
 insert into promotion_rules(shop_id,platform,rule_name) values(shop,'pinterest','default-organic');
 insert into content_variants(shop_id,product_id,platform,creative_id,image_url,title,body,destination_url,status) values(shop,product,'pinterest','test','https://i.etsystatic.com/a.jpg','Test','Description','https://www.etsy.com/listing/123/item','draft') returning id into creative;
 insert into publish_queue(shop_id,product_id,content_variant_id,platform,social_account_id,status) values(shop,product,creative,'pinterest',account,'draft') returning id into queue;

 update pinterest_publish_settings set enabled=false,access_tier='trial';
 if claim_pinterest_publish_trial()->>'status'<>'blocked' then raise exception 'Unapproved trial allowed'; end if;
 insert into pinterest_trial_demo(queue_id,board_id,snapshot) values(queue,'1234',pinterest_publish_snapshot(queue));
 update content_variants set title='changed' where id=creative;
 if claim_pinterest_publish_trial()->>'status'<>'blocked' then raise exception 'Stale trial review allowed'; end if;
 update content_variants set title='Test' where id=creative;
 job:=claim_pinterest_publish_trial();a:=(job->>'attempt_id')::uuid;
 if job->>'status'<>'claimed' then raise exception 'Trial not claimed: %',job; end if;
 if claim_pinterest_publish_trial()->>'status'<>'blocked' then raise exception 'Trial claimed twice'; end if;
 if claim_pinterest_publish()->>'status'<>'blocked' then raise exception 'Production gate changed'; end if;
 if not dispatch_pinterest_publish_trial(a) then raise exception 'Trial dispatch blocked'; end if;
 if dispatch_pinterest_publish_trial(a) then raise exception 'Duplicate trial dispatch'; end if;
 perform finish_pinterest_publish_trial(a,'published','123456789');
 perform finish_pinterest_publish_trial(a,'published','123456789');
 if exists(select 1 from publish_history where content_variant_id=creative) then raise exception 'Test counted as promotion'; end if;
 if (select status from publish_queue where id=queue)<>'draft' then raise exception 'Production queue changed'; end if;
 if claim_pinterest_publish_trial()->>'status'<>'blocked' then raise exception 'Trial replay permitted'; end if;
 if has_function_privilege('anon','public.claim_pinterest_publish_trial()','execute') or has_table_privilege('authenticated','public.pinterest_trial_demo','select') then raise exception 'Demo exposed'; end if;
end $$;
rollback;
