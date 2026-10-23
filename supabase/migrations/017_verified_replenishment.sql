-- Administrative ingestion only. Evidence comes from an administrator-reviewed batch.
create function public.replenish_verified_products(p_items jsonb,p_batch text) returns jsonb
language plpgsql security invoker set search_path='' as $$
declare item jsonb; shop uuid; account uuid; product uuid; creative uuid; queued uuid;
 added integer:=0; skipped integer:=0;
begin
 perform pg_advisory_xact_lock(1617125,13);
 if jsonb_typeof(p_items) is distinct from 'array' or jsonb_array_length(p_items) not between 1 and 100
 or p_batch is null or p_batch !~ '^[a-zA-Z0-9_-]{1,80}$' then raise exception 'Invalid batch'; end if;
 if (select count(distinct x->>'listing_id') from jsonb_array_elements(p_items) x)<>jsonb_array_length(p_items)
 then raise exception 'Duplicate or missing listing IDs'; end if;
 if not exists(select 1 from public.pinterest_publish_settings where singleton and enabled and access_tier='standard')
 then raise exception 'Enabled Standard required'; end if;
 for item in select value from jsonb_array_elements(p_items) loop
   select id into shop from public.shops where shop_name=item->>'shop' and status='active';
   if shop is null then raise exception 'Shop unavailable'; end if;
   if exists(select 1 from public.products where etsy_listing_id=item->>'listing_id' and shop_id<>shop)
   then raise exception 'Listing belongs to a different shop'; end if;
   -- Retries never refresh evidence, alter history, or duplicate existing stock.
   if exists(select 1 from public.products where etsy_listing_id=item->>'listing_id' and shop_id=shop)
   then skipped:=skipped+1; continue; end if;
   if coalesce(item->>'visual_verified','false')<>'true' or coalesce(item->>'available','false')<>'true'
   or item->>'checked_at' is null or not ((item->>'checked_at')::timestamptz between now()-interval '24 hours' and now())
   then raise exception 'Verification expired or incomplete'; end if;
   if coalesce(item->>'listing_id','') !~ '^[0-9]+$'
   or coalesce(item->>'source_url','') !~ ('^https://www[.]etsy[.]com/listing/'||(item->>'listing_id')||'/[a-zA-Z0-9_-]+$')
   or coalesce(item->>'image_url','') !~ '^https://i[.]etsystatic[.]com/[a-zA-Z0-9_./-]+[.](jpg|jpeg|png|webp)$'
   or coalesce(item->>'board_id','') !~ '^[0-9]+$'
   or length(trim(coalesce(item->>'new_title',''))) not between 1 and 100
   or length(trim(coalesce(item->>'body',''))) not between 1 and 800
   or length(trim(coalesce(item->>'category','')))=0
   then raise exception 'Invalid source or creative'; end if;
   if (select count(*) from public.shop_social_accounts m
     join public.social_accounts a on a.id=m.social_account_id and a.active and a.platform='pinterest'
     join public.pinterest_oauth_credentials c on c.social_account_id=a.id and lower(c.pinterest_username)=lower(a.handle)
     where m.shop_id=shop and m.active and m.platform='pinterest' and a.handle=item->>'handle')<>1
   then raise exception 'Batch routing or authorization changed'; end if;
   select a.id into account from public.social_accounts a join public.shop_social_accounts m on m.social_account_id=a.id
   where m.shop_id=shop and m.active and m.platform='pinterest' and a.platform='pinterest' and a.handle=item->>'handle' and a.active;
   insert into public.products(shop_id,etsy_listing_id,etsy_url,title,category,listing_status,primary_image_url,original_image_urls,source_payload,source_discovered_at,last_seen_at)
   values(shop,item->>'listing_id',item->>'source_url',item->>'new_title',item->>'category','active',item->>'image_url',jsonb_build_array(item->>'image_url'),
     jsonb_build_object('verified_at',item->>'checked_at','source',item->>'source_url','image_verified',true,'batch',p_batch),
     (item->>'checked_at')::timestamptz,(item->>'checked_at')::timestamptz) returning id into product;
   insert into public.content_variants(shop_id,product_id,platform,creative_id,image_url,title,body,destination_url,board_or_category,content_type,status)
   values(shop,product,'pinterest',p_batch,item->>'image_url',item->>'new_title',item->>'body',item->>'source_url',item->>'category','product','ready') returning id into creative;
   insert into public.content_variants(shop_id,product_id,platform,creative_id,image_url,title,body,destination_url,board_or_category,content_type,status)
   values(shop,product,'facebook',p_batch,item->>'image_url',item->>'new_title',item->>'facebook_draft',item->>'source_url',item->>'category','product','draft');
   insert into public.publish_queue(shop_id,product_id,content_variant_id,platform,social_account_id,status)
   values(shop,product,creative,'pinterest',account,'ready') returning id into queued;
   insert into public.pinterest_publish_reviews(queue_id,board_id,snapshot,listing_checked_at,source_url)
   values(queued,item->>'board_id',public.pinterest_publish_snapshot(queued),(item->>'checked_at')::timestamptz,item->>'source_url');
   added:=added+1;
 end loop;
 return jsonb_build_object('inserted',added,'skipped_existing',skipped,'input',jsonb_array_length(p_items));
end $$;
revoke all on function public.replenish_verified_products(jsonb,text) from public,anon,authenticated,service_role;
