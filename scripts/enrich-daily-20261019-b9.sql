begin;
set local statement_timeout='20s';
select pg_advisory_xact_lock(1617125,13);
create temporary table batch_input as select * from jsonb_to_recordset($data$[{"shop": "DanyHomeDesign", "handle": "icyndizhang", "listing_id": "4481217943", "source_url": "https://www.etsy.com/listing/4481217943/checkered-sheer-curtain-52-width-light", "category": "Sheer Curtains", "board_id": "801218658646993070", "new_title": "Checkered Linen-Look Sheer Curtain", "body": "A checkered pattern and linen-look texture add a soft detail to a window. DanyHomeDesign offers this made-to-order sheer curtain as one panel. Choose a full curtain size; samples and tiebacks are separate options.", "image_url": "https://i.etsystatic.com/44677612/r/il/fbcad0/7930801628/il_794xN.7930801628_91aa.jpg", "facebook_draft": "A light checkered window accent from DanyHomeDesign. Select the panel size you need; the listing also includes separate sample and tieback options. https://www.etsy.com/listing/4481217943/checkered-sheer-curtain-52-width-light", "checked_at": "2026-10-19T02:17:23.559540+00:00", "visual_verified": true, "available": true}]$data$::jsonb) x(shop text,listing_id text,source_url text,category text,board_id text,new_title text,body text,image_url text,checked_at timestamptz,facebook_draft text,handle text);
do $$ begin
 if not exists(select 1 from pinterest_publish_settings where singleton and enabled and access_tier='standard') then raise exception 'Enabled Standard required'; end if;
 if exists(select 1 from batch_input where checked_at<now()-interval '24 hours' or checked_at>now()) then raise exception 'Verification expired'; end if;
 if (select count(*) from batch_input x join shops s on s.shop_name=x.shop and s.status='active' join shop_social_accounts m on m.shop_id=s.id and m.active and m.platform='pinterest' join social_accounts a on a.id=m.social_account_id and a.handle=x.handle and a.active and a.platform='pinterest' join pinterest_oauth_credentials cr on cr.social_account_id=a.id and lower(cr.pinterest_username)=x.handle)<>1 then raise exception 'Batch routing or authorization changed'; end if;
end $$;
-- Report prior records before inserting; only genuinely new products enter this batch.
select json_build_object('preexisting_listing',p.etsy_listing_id,'history_count',(select count(*) from publish_history h where h.product_id=p.id)) from products p join batch_input x on x.listing_id=p.etsy_listing_id;
create temporary table new_products(id uuid,shop_id uuid,etsy_listing_id text);
with ins as (
 insert into products(shop_id,etsy_listing_id,etsy_url,title,category,listing_status,primary_image_url,original_image_urls,source_payload,source_discovered_at,last_seen_at)
 select s.id,x.listing_id,x.source_url,x.new_title,x.category,'active',x.image_url,jsonb_build_array(x.image_url),jsonb_build_object('verified_at',x.checked_at,'source',x.source_url,'image_verified',true,'batch','daily-20261019-b9'),x.checked_at,x.checked_at from batch_input x join shops s on s.shop_name=x.shop
 where not exists(select 1 from products p where p.etsy_listing_id=x.listing_id)
 on conflict(shop_id,etsy_listing_id) do nothing returning id,shop_id,etsy_listing_id
) insert into new_products select * from ins;
insert into content_variants(shop_id,product_id,platform,creative_id,image_url,title,body,destination_url,board_or_category,content_type,status)
select p.shop_id,p.id,'pinterest','verified-original-20261019',x.image_url,x.new_title,x.body,x.source_url,x.category,'product','ready' from new_products p join batch_input x on x.listing_id=p.etsy_listing_id;
insert into content_variants(shop_id,product_id,platform,creative_id,image_url,title,body,destination_url,board_or_category,content_type,status)
select p.shop_id,p.id,'facebook','verified-original-20261019',x.image_url,x.new_title,x.facebook_draft,x.source_url,x.category,'product','draft' from new_products p join batch_input x on x.listing_id=p.etsy_listing_id;
insert into publish_queue(shop_id,product_id,content_variant_id,platform,social_account_id,status)
select p.shop_id,p.id,cv.id,'pinterest',a.id,'ready' from new_products p join batch_input x on x.listing_id=p.etsy_listing_id join content_variants cv on cv.product_id=p.id and cv.platform='pinterest' join social_accounts a on a.handle=x.handle and a.platform='pinterest';
insert into pinterest_publish_reviews(queue_id,board_id,snapshot,listing_checked_at,source_url)
select q.id,x.board_id,pinterest_publish_snapshot(q.id),x.checked_at,x.source_url from new_products p join batch_input x on x.listing_id=p.etsy_listing_id join publish_queue q on q.product_id=p.id and q.platform='pinterest';
select json_build_object('listing_id',p.etsy_listing_id,'queue_id',q.id,'status',q.status,'board_id',r.board_id,'snapshot_matches',r.snapshot=pinterest_publish_snapshot(q.id)) from products p join batch_input x on x.listing_id=p.etsy_listing_id join publish_queue q on q.product_id=p.id and q.platform='pinterest' join pinterest_publish_reviews r on r.queue_id=q.id;
commit;
