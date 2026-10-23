begin read only;
set local statement_timeout='20s';
-- Three reviewed items per active shop/account is the replenishment floor,
-- not a promise of three publications or seven days of account coverage.
with stock as (
 select m.shop_id,m.social_account_id,s.shop_name,a.account_name,a.handle,
 count(q.id) filter(where q.status in ('ready','scheduled') and p.listing_status='active'
 and cv.status='ready' and r.snapshot=public.pinterest_publish_snapshot(q.id)
 and r.listing_checked_at>now()-interval '29 days' and r.reviewed_at>now()-interval '29 days')::int as usable
 from shop_social_accounts m join shops s on s.id=m.shop_id and s.status='active'
 join social_accounts a on a.id=m.social_account_id and a.active
 left join publish_queue q on q.shop_id=m.shop_id and q.social_account_id=m.social_account_id and q.platform='pinterest'
 left join products p on p.id=q.product_id left join content_variants cv on cv.id=q.content_variant_id
 left join pinterest_publish_reviews r on r.queue_id=q.id
 where m.active and m.platform='pinterest' and a.platform='pinterest'
 group by m.shop_id,m.social_account_id,s.shop_name,a.account_name,a.handle
)
select json_build_object('replenishment_plan',json_build_object('shop',shop_name,'account',account_name,
 'handle',handle,'usable',usable,'target',3,'deficit',greatest(0,3-usable),
 'known_listing_ids',(select coalesce(json_agg(p.etsy_listing_id),'[]'::json) from products p where p.shop_id=stock.shop_id),
 'previous_routes',(select coalesce(json_agg(x),'[]'::json) from (
 select distinct cv.board_or_category as category,r.board_id from publish_queue q
 join content_variants cv on cv.id=q.content_variant_id join pinterest_publish_reviews r on r.queue_id=q.id
 where q.shop_id=stock.shop_id and q.social_account_id=stock.social_account_id) x)))
from stock order by usable,shop_name,account_name;
commit;
