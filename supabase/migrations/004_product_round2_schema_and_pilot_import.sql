-- 004_product_round2_schema_and_pilot_import.sql
-- Add listing-level promotion taxonomy and seed a pilot set of public Etsy listings.

alter table products
  add column if not exists product_type text,
  add column if not exists style_tags text[] not null default '{}',
  add column if not exists material_tags text[] not null default '{}',
  add column if not exists room_tags text[] not null default '{}',
  add column if not exists pinterest_boards text[] not null default '{}',
  add column if not exists facebook_cluster text,
  add column if not exists evergreen_eligible boolean not null default true,
  add column if not exists source_type text not null default 'public_web',
  add column if not exists source_discovered_at timestamptz,
  add column if not exists last_seen_at timestamptz;

create index if not exists idx_products_product_type on products(product_type);
create index if not exists idx_products_evergreen on products(shop_id, evergreen_eligible);

with s as (select id from shops where shop_code='SHOP-001')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Curtains', 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Curtains & Window Styling', true, 'public_web', now(), now()
from s cross join (values
('4449345616','https://www.etsy.com/listing/4449345616/vintage-houndstooth-curtain-brown-room','Vintage Houndstooth Curtain, Brown Room Darkening Window Drapes, Custom Size','full_length_curtain',array['vintage','houndstooth'],array[]::text[],array['living_room','bedroom'],array['Custom Curtains','Bedroom Curtains']::text[]),
('1905317635','https://www.etsy.com/listing/1905317635/black-checkered-curtain-gingham-window','Checkered Curtain, Gingham Window Panel, Farmhouse Semi Blackout Drape for Living Room','full_length_curtain',array['gingham','farmhouse'],array[]::text[],array['living_room'],array['Farmhouse Curtains','Floral & Patterned Curtains']::text[]),
('1842796344','https://www.etsy.com/listing/1842796344/green-gingham-kitchen-curtainrod-pocket','Gingham Kitchen Curtain, Rod Pocket Rustic Cafe Curtain With Lace Trim','cafe_curtain',array['gingham','rustic','farmhouse'],array[]::text[],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Farmhouse Curtains']::text[]),
('1856975829','https://www.etsy.com/listing/1856975829/double-layer-cafe-curtain-green-plaid','Double Layer Cafe Curtain, Plaid Short Curtain for Kitchen or Cabinets, Rod Pocket','cafe_curtain',array['plaid','country'],array['blended'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains']::text[]),
('1845789821','https://www.etsy.com/listing/1845789821/mint-green-gingham-cafe-curtains-ruffle','Gingham Cafe Curtains: Ruffle Trim Farmhouse Door Curtains (1 Panel)','cafe_curtain',array['gingham','farmhouse','ruffle'],array['blended'],array['kitchen'],array['Cafe Curtains','Farmhouse Curtains']::text[]),
('1702252202','https://www.etsy.com/listing/1702252202/checkered-cotton-linen-curtain-milk-tea','Natural Linen Blend Tab Top Curtain, Grid Check Sheer Panel, Farmhouse Window Curtain','full_length_curtain',array['checkered','farmhouse','natural'],array['cotton','linen'],array['living_room','bedroom'],array['Linen Curtains','Farmhouse Curtains']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,pinterest_boards=excluded.pinterest_boards,
  facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

with s as (select id from shops where shop_code='SHOP-002')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Curtains', 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Curtains & Window Styling', true, 'public_web', now(), now()
from s cross join (values
('4448391965','https://www.etsy.com/listing/4448391965/white-cotton-curtains-natural-light','White Cotton Curtains, Natural Light Filtering Drapes For Bedroom & Living Room','full_length_curtain',array['minimal','natural'],array['cotton','linen'],array['bedroom','living_room'],array['Linen Curtains','Bedroom Curtains']::text[]),
('1506884608','https://www.etsy.com/listing/1506884608/linen-noren-curtain-japanese-style-room','Linen Noren Curtain: Japanese Style Room Divider, Custom Size','noren_curtain',array['japanese','minimal'],array['linen','cotton'],array['kitchen','bathroom','bedroom','hallway'],array['Noren Curtains','Room Divider Curtains']::text[]),
('4450630323','https://www.etsy.com/listing/4450630323/white-linen-blend-cafe-curtain-kitchen','White Linen Blend Cafe Curtain, Kitchen Window Tier, Rod Pocket','cafe_curtain',array['minimal','natural'],array['linen'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Linen Curtains']::text[]),
('4349378423','https://www.etsy.com/listing/4349378423/stripe-cafe-curtain-boho-crochet-trim','Stripe Cafe Curtain: Boho Crochet Trim Valance Curtain','cafe_curtain',array['boho','striped'],array['polyester'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains']::text[]),
('4438724155','https://www.etsy.com/listing/4438724155/linen-striped-curtains-with-valance','Linen Striped Curtains with Valance, Farmhouse Blue Stripe Light Filtering Window Drapes','full_length_curtain',array['striped','farmhouse'],array['linen','cotton'],array['living_room','bedroom'],array['Linen Curtains','Farmhouse Curtains']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,pinterest_boards=excluded.pinterest_boards,
  facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

with s as (select id from shops where shop_code='SHOP-003')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Curtains', 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Curtains & Window Styling', true, 'public_web', now(), now()
from s cross join (values
('4359318131','https://www.etsy.com/listing/4359318131/chenille-blackout-curtains-herringbone','Chenille Blackout Curtains: Herringbone Texture, 7 Colors','blackout_curtain',array['modern','herringbone'],array['chenille'],array['bedroom','living_room','study'],array['Blackout Curtains','Bedroom Curtains']::text[]),
('4363644082','https://www.etsy.com/listing/4363644082/white-herringbone-sheer-curtain-elegant','Modern Herringbone Sheer Curtain: Elegant Light-filtering Voile Panel','sheer_curtain',array['modern','herringbone'],array[]::text[],array['living_room','bedroom'],array['Sheer Curtains','Bedroom Curtains']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,pinterest_boards=excluded.pinterest_boards,
  facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

with s as (select id from shops where shop_code='SHOP-004')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Curtains', 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Curtains & Window Styling', true, 'public_web', now(), now()
from s cross join (values
('4366238220','https://www.etsy.com/listing/4366238220/green-leaf-blackout-curtains-cotton','Modern Leaf Blackout Curtains: Cotton-linen Blend, American Style Drapes','blackout_curtain',array['botanical','modern'],array['cotton','linen'],array['bedroom','living_room'],array['Blackout Curtains','Floral Curtains']::text[]),
('1873105176','https://www.etsy.com/listing/1873105176/linen-blend-curtains-vintage-french','Linen Blend Curtains: Vintage French Country Toile Light Filtering Drapes','full_length_curtain',array['vintage','french_country','toile'],array['linen'],array['living_room','bedroom'],array['French Country Curtains','Linen Curtains']::text[]),
('4299980520','https://www.etsy.com/listing/4299980520/lemon-embroidered-sheer-curtain','Lemon Embroidered Sheer Curtain','sheer_curtain',array['embroidered','botanical'],array[]::text[],array['kitchen','living_room'],array['Sheer Curtains','Embroidered Curtains']::text[]),
('4310626154','https://www.etsy.com/listing/4310626154/floral-semi-blackout-curtains','Floral Semi Blackout Curtains: Cottagecore Botanical Drapes','semi_blackout_curtain',array['floral','cottagecore','botanical'],array[]::text[],array['bedroom','living_room'],array['Floral Curtains','Cottagecore Curtains']::text[]),
('4332536339','https://www.etsy.com/listing/4332536339/embroidered-leaf-sheer-curtain-light','Embroidered Leaf Sheer Curtain: Light Filtering Voile Drapes','sheer_curtain',array['embroidered','botanical'],array[]::text[],array['living_room','bedroom'],array['Sheer Curtains','Embroidered Curtains']::text[]),
('4365994633','https://www.etsy.com/listing/4365994633/floral-short-curtains-for-kitchen-elgent','Floral Short Curtains for Kitchen, Elegant Cafe Curtain With Ruffles','cafe_curtain',array['floral','ruffle'],array[]::text[],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Floral Curtains']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,pinterest_boards=excluded.pinterest_boards,
  facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

do $$
declare c integer;
begin
  select count(*) into c from products
  where shop_id in (select id from shops where shop_code in ('SHOP-001','SHOP-002','SHOP-003','SHOP-004'));
  if c < 19 then
    raise exception 'Pilot product import incomplete: expected at least 19 rows, found %', c;
  end if;
end $$;
