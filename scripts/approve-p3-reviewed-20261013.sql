-- Fixed, bounded review approval. No credential reads and no Pin dispatch.
begin;
set local statement_timeout='20s';
set local lock_timeout='5s';
select pg_advisory_xact_lock(1617125,13);
create temporary table reviewed_input as select * from jsonb_to_recordset('[{"queue_id": "dc598e2f-bcc6-470e-b1ee-7627cb7c4011", "shop": "CellaHo", "listing_id": "1538587663", "source_url": "https://www.etsy.com/listing/1538587663/green-embroidered-cotton-fabric-floral", "category": "Embroidered Fabric", "image_url": null, "destination_url": "https://www.etsy.com/listing/1538587663/green-embroidered-cotton-fabric-floral", "title": "Green Embroidered Cotton Fabric, Floral Pattern", "body": "Green Embroidered Cotton Fabric, Floral Pattern Style: floral, embroidered. Materials: cotton. View details and available options on Etsy.", "handle": "mydecorshop", "mapped": true, "history_count": 0, "review_exists": false, "board_id": "499618221101238533", "new_title": "Green Floral Embroidered Fabric for Cushion Projects", "new_body": "Sage green fabric with delicate white floral embroidery from CellaHo. Explore this fabric for cushion and home decor sewing projects. Visit the original Etsy listing for available options and current details.", "checked_at": "2026-10-13T02:47:57.532Z", "new_image_url": "https://i.etsystatic.com/39663062/r/il/586d7c/7171992756/il_794xN.7171992756_87hn.jpg"}]'::jsonb) as x(queue_id uuid,shop text,listing_id text,source_url text,category text,image_url text,destination_url text,title text,body text,handle text,board_id text,new_title text,new_body text,checked_at timestamptz,new_image_url text);
select q.id from publish_queue q join reviewed_input x on x.queue_id=q.id for update of q;
select cv.id from content_variants cv join publish_queue q on q.content_variant_id=cv.id join reviewed_input x on x.queue_id=q.id for update of cv;
select p.id from products p join publish_queue q on q.product_id=p.id join reviewed_input x on x.queue_id=q.id for update of p;
do $$
begin
 if not exists(select 1 from pinterest_publish_settings where singleton and enabled and access_tier='standard') then raise exception 'Enabled Standard settings required'; end if;
 if exists(select 1 from reviewed_input where checked_at < now()-interval '24 hours' or checked_at>now()) then raise exception 'Fixed approval expired'; end if;
 if (select count(*) from reviewed_input x join publish_queue q on q.id=x.queue_id join products p on p.id=q.product_id and p.shop_id=q.shop_id join shops s on s.id=q.shop_id join content_variants cv on cv.id=q.content_variant_id and cv.product_id=p.id and cv.shop_id=s.id join social_accounts a on a.id=q.social_account_id
 where q.platform='pinterest' and cv.platform='pinterest' and q.status in ('draft','ready') and cv.status in ('draft','ready') and s.status='active' and a.active and a.handle=x.handle and a.platform='pinterest' and s.shop_name=x.shop and p.etsy_listing_id=x.listing_id and p.etsy_url=x.source_url and cv.destination_url=x.destination_url and cv.board_or_category=x.category and cv.image_url is not distinct from x.image_url and cv.title=x.title and cv.body=x.body
 and exists(select 1 from shop_social_accounts m where m.shop_id=s.id and m.social_account_id=a.id and m.platform='pinterest' and m.active)
 and exists(select 1 from pinterest_oauth_credentials cr where cr.social_account_id=a.id and lower(cr.pinterest_username)=lower(a.handle))
 and not exists(select 1 from publish_history h where h.product_id=p.id and h.platform='pinterest')
 and not exists(select 1 from pinterest_publish_attempts pa where pa.queue_id=q.id)) <> 1 then raise exception 'Expected 1 unchanged, mapped, unattempted drafts'; end if;
 if exists(select 1 from pinterest_publish_reviews rev join reviewed_input x on rev.queue_id=x.queue_id where rev.board_id<>x.board_id or rev.snapshot<>pinterest_publish_snapshot(x.queue_id)) then raise exception 'Existing review differs'; end if;
end $$;
update products p set listing_status='active',last_seen_at=x.checked_at from publish_queue q join reviewed_input x on x.queue_id=q.id where p.id=q.product_id;
update content_variants cv set status='ready',title=x.new_title,body=x.new_body,image_url=x.new_image_url from publish_queue q join reviewed_input x on x.queue_id=q.id where cv.id=q.content_variant_id;
insert into pinterest_publish_reviews(queue_id,board_id,snapshot,listing_checked_at,source_url)
select x.queue_id,x.board_id,pinterest_publish_snapshot(x.queue_id),x.checked_at,x.source_url from reviewed_input x on conflict(queue_id) do nothing;
update publish_queue q set status='ready',updated_at=now() from reviewed_input x where q.id=x.queue_id and q.status='draft';
select json_build_object('queue_id',q.id,'status',q.status,'board_id',rev.board_id,'snapshot_matches',rev.snapshot=pinterest_publish_snapshot(q.id),'listing_checked_at',rev.listing_checked_at) from publish_queue q join reviewed_input x on x.queue_id=q.id join pinterest_publish_reviews rev on rev.queue_id=q.id;
select json_build_object('public_publish_enabled',enabled) from pinterest_publish_settings where singleton;
commit;
