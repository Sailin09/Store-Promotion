-- Fixed, bounded review approval. No credential reads and no Pin dispatch.
begin;
set local statement_timeout='20s';
set local lock_timeout='5s';
select pg_advisory_xact_lock(1617125,13);
create temporary table reviewed_input as select * from jsonb_to_recordset('[{"queue_id": "69dbd819-d043-4910-a7df-379f585539e2", "shop": "Adamideal", "listing_id": "4449956852", "source_url": "https://www.etsy.com/listing/4449956852/desktop-power-strip-organizer-box-cable", "category": "Wooden Home Organization", "image_url": "https://i.etsystatic.com/35172699/r/il/5f74b7/7894413148/il_794xN.7894413148_ckp1.jpg", "destination_url": "https://www.etsy.com/listing/4449956852/desktop-power-strip-organizer-box-cable", "title": "Desk Cable Organizer Box for a Tidy Workspace", "body": "Keep desk cables together with this lidded cable organizer from Adamideal. Explore the available options and current product details in the Etsy listing.", "handle": "sailing_981", "board_id": "863494997243989843"}, {"queue_id": "6344e1e9-a294-4207-b9dc-d198439d26f2", "shop": "LambertHouse", "listing_id": "1803029273", "source_url": "https://www.etsy.com/listing/1803029273/gold-aluminum-open-ended-pants-hangers", "category": "Closet Organization", "image_url": "https://i.etsystatic.com/46944744/r/il/24b1c9/6362709485/il_794xN.6362709485_snh1.jpg", "destination_url": "https://www.etsy.com/listing/1803029273/gold-aluminum-open-ended-pants-hangers", "title": "Gold Open-Ended Hangers for Closet Organization", "body": "Organize trousers and scarves with these gold-tone open-ended hangers from LambertHouse. View available options and product details in the Etsy listing.", "handle": "sailing_981", "board_id": "863494997243989843"}]'::jsonb) as x(queue_id uuid,shop text,listing_id text,source_url text,category text,image_url text,destination_url text,title text,body text,handle text,board_id text);
select q.id from publish_queue q join reviewed_input x on x.queue_id=q.id for update of q;
select cv.id from content_variants cv join publish_queue q on q.content_variant_id=cv.id join reviewed_input x on x.queue_id=q.id for update of cv;
select p.id from products p join publish_queue q on q.product_id=p.id join reviewed_input x on x.queue_id=q.id for update of p;
do $$
begin
 if not exists(select 1 from pinterest_publish_settings where singleton and not enabled and access_tier='standard') then raise exception 'Disabled Standard settings required'; end if;
 if now() > '2026-10-13T01:47:17.563133+00:00'::timestamptz + interval '24 hours' then raise exception 'Fixed approval expired'; end if;
 if (select count(*) from reviewed_input x join publish_queue q on q.id=x.queue_id join products p on p.id=q.product_id and p.shop_id=q.shop_id join shops s on s.id=q.shop_id join content_variants cv on cv.id=q.content_variant_id and cv.product_id=p.id and cv.shop_id=s.id join social_accounts a on a.id=q.social_account_id
 where q.platform='pinterest' and cv.platform='pinterest' and q.status in ('draft','ready') and cv.status in ('draft','ready') and s.status='active' and a.active and a.handle=x.handle and a.platform='pinterest' and s.shop_name=x.shop and p.etsy_listing_id=x.listing_id and p.etsy_url=x.source_url and cv.destination_url=x.destination_url and cv.board_or_category=x.category and cv.image_url=x.image_url and cv.title=x.title and cv.body=x.body
 and exists(select 1 from shop_social_accounts m where m.shop_id=s.id and m.social_account_id=a.id and m.platform='pinterest' and m.active)
 and exists(select 1 from pinterest_oauth_credentials cr where cr.social_account_id=a.id and lower(cr.pinterest_username)=lower(a.handle))
 and not exists(select 1 from publish_history h where h.product_id=p.id and h.platform='pinterest')
 and not exists(select 1 from pinterest_publish_attempts pa where pa.queue_id=q.id)) <> 2 then raise exception 'Expected two unchanged, mapped, unattempted drafts'; end if;
 if exists(select 1 from pinterest_publish_reviews rev join reviewed_input x on rev.queue_id=x.queue_id where rev.board_id<>x.board_id or rev.snapshot<>pinterest_publish_snapshot(x.queue_id)) then raise exception 'Existing review differs'; end if;
end $$;
update products p set listing_status='active',last_seen_at='2026-10-13T01:47:17.563133+00:00'::timestamptz from publish_queue q join reviewed_input x on x.queue_id=q.id where p.id=q.product_id;
update content_variants cv set status='ready' from publish_queue q join reviewed_input x on x.queue_id=q.id where cv.id=q.content_variant_id;
insert into pinterest_publish_reviews(queue_id,board_id,snapshot,listing_checked_at,source_url)
select x.queue_id,x.board_id,pinterest_publish_snapshot(x.queue_id),'2026-10-13T01:47:17.563133+00:00'::timestamptz,x.source_url from reviewed_input x on conflict(queue_id) do nothing;
update publish_queue q set status='ready',updated_at=now() from reviewed_input x where q.id=x.queue_id and q.status='draft';
select json_build_object('queue_id',q.id,'status',q.status,'board_id',rev.board_id,'snapshot_matches',rev.snapshot=pinterest_publish_snapshot(q.id),'listing_checked_at',rev.listing_checked_at) from publish_queue q join reviewed_input x on x.queue_id=q.id join pinterest_publish_reviews rev on rev.queue_id=q.id;
select json_build_object('public_publish_enabled',enabled) from pinterest_publish_settings where singleton;
commit;
