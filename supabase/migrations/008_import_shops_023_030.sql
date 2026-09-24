-- 008_import_shops_023_030.sql
-- Representative public-listing import for SHOP-023 through SHOP-030.

-- SHOP-023 HibiChStudio
with s as (select id from shops where shop_code='SHOP-023')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Storage', 'active', 'wall_organizer', v.style_tags, v.material_tags, v.room_tags, array['Wall & Door Organizers','Closet Organization']::text[], 'Closet & Home Organization', true, 'public_web', now(), now()
from s cross join (values
('4374362269','https://www.etsy.com/listing/4374362269/multi-pocket-hanging-bag-thick-wall','Multi-Pocket Hanging Bag, Thick Wall Organizer for Bedside or Over-Door Storage',array['minimal','natural'],array['cotton','linen'],array['bedroom','office','dorm']),
('4374349912','https://www.etsy.com/listing/4374349912/canvas-wall-hanging-organizer-multi','Canvas Wall Hanging Organizer, Multi Pocket Storage Bag, Over Door Bedside Organizer',array['minimal','scandinavian'],array['canvas'],array['bedroom','kitchen','bathroom','office']),
('4391652370','https://www.etsy.com/listing/4391652370/canvas-wall-hanging-organizer-over-door','Canvas Wall Hanging Organizer, Over Door Storage Bag, Dorm Room Closet Organizer',array['minimal','boho','scandinavian'],array['canvas','cotton','linen'],array['dorm','office','closet'])
) as v(listing_id,url,title,style_tags,material_tags,room_tags)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-024 PearlsTreasuresArt
with s as (select id from shops where shop_code='SHOP-024')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Jewelry', 'active', v.product_type, v.style_tags, v.material_tags, array[]::text[], array['Seashell Jewelry','Coastal Jewelry']::text[], 'Coastal Decor & Jewelry', true, 'public_web', now(), now()
from s cross join (values
('4339516931','https://www.etsy.com/listing/4339516931/handmade-sea-snail-shell-necklace-long','Handmade Sea Snail Shell Necklace: Long Beaded Boho Pendant','necklace',array['coastal','boho','shell'],array['shell','seed_beads']),
('4348858512','https://www.etsy.com/listing/4348858512/pearl-tassel-seashell-earrings-handmade','Pearl Tassel Seashell Earrings: Handmade Ocean-Inspired Statement Jewelry','earrings',array['coastal','statement','shell'],array['shell','pearl']),
('1904477471','https://www.etsy.com/listing/1904477471/seashell-pearl-drop-earrings-gold-hoop','Seashell Pearl Drop Earrings: Gold Hoop Coastal Jewelry','earrings',array['coastal','minimal','shell'],array['shell','pearl','metal'])
) as v(listing_id,url,title,product_type,style_tags,material_tags)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-025 QuGifts
with s as (select id from shops where shop_code='SHOP-025')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, array['Coastal Home Decor','Shell Decor','Boho Home Decor']::text[], 'Coastal Decor & Jewelry', true, 'public_web', now(), now()
from s cross join (values
('4348907433','https://www.etsy.com/listing/4348907433/handmade-cowrie-shell-tassel-coastal','Handmade Cowrie Shell Tassel: Coastal Boho Wall Hanging','Home Decor','wall_hanging',array['coastal','boho','wabi_sabi'],array['shell','cotton','polyester'],array['living_room','entryway']),
('4399003122','https://www.etsy.com/listing/4399003122/wood-bead-door-curtain-handmade-door','Wood Bead Door Curtain, Handmade Door Hanging, Boho Room Divider, Rustic Entryway Decor','Home Decor','door_curtain',array['boho','rustic','minimal'],array['wood','cotton'],array['entryway','living_room']),
('4359523943','https://www.etsy.com/listing/4359523943/handmade-woven-seagrass-shell-basket','Handmade Woven Seagrass Shell Basket with Lid: Boho Desktop Organizer','Storage','decorative_basket',array['coastal','boho','rustic'],array['seagrass','shell'],array['office','bedroom','living_room']),
('4315230146','https://www.etsy.com/listing/4315230146/seashell-wine-bottle-stopper-coastal-bar','Seashell Wine Bottle Stopper: Coastal Bar Accessory, Beach Wedding Favor','Barware','bottle_stopper',array['coastal','beach','gift'],array['shell','metal'],array['kitchen','bar'])
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-026 NngGoods
with s as (select id from shops where shop_code='SHOP-026')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, '4351662726', 'https://www.etsy.com/listing/4351662726/natural-pebble-stone-drawer-knob-single',
'Natural Pebble Stone Drawer Knob, Single Hole Cabinet Pull Handle','Hardware','active','cabinet_knob',
array['natural','organic','minimal'],array['stone'],array['kitchen','bathroom','bedroom'],
array['Cabinet Knobs & Pulls','Natural Stone Hardware'], 'Coastal Decor & Jewelry', true, 'public_web', now(), now()
from s
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-027 MiraKiuStudio
with s as (select id from shops where shop_code='SHOP-027')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Aprons', 'active', 'apron_dress', v.style_tags, array['cotton']::text[], array['kitchen','garden']::text[], array['Vintage Aprons','French Country Home']::text[], 'Giftable Accessories', true, 'public_web', now(), now()
from s cross join (values
('4385581970','https://www.etsy.com/listing/4385581970/white-cotton-apron-with-lace-hem-french','White Cotton Apron with Lace Hem: French Country Cottagecore Style',array['french_country','cottagecore','lace']),
('4464822987','https://www.etsy.com/listing/4464822987/vintage-white-ruffle-lace-apron-cotton','Vintage White Ruffle Lace Apron | Cotton Sleeveless Apron Dress with Adjustable Straps',array['vintage','french_style','ruffle','lace']),
('4489980889','https://www.etsy.com/listing/4489980889/white-cotton-ruffle-apron-dressvintage','White Cotton Ruffle Apron Dress, Vintage Lace Trim Apron with Pocket',array['vintage','ruffle','lace'])
) as v(listing_id,url,title,style_tags)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-028 StellaGoodsGifts
with s as (select id from shops where shop_code='SHOP-028')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, '4316038513', 'https://www.etsy.com/listing/4316038513/vintage-velvet-jacquard-pillow-cover',
'Vintage Velvet Jacquard Pillow Cover: Asian Style Floral Cushion','Pillow Covers','active','pillow_cover',
array['vintage','asian_style','floral','jacquard'],array['velvet'],array['living_room','bedroom'],
array['Decorative Pillow Covers','French Country Home'], 'Home Textiles & Comfort', true, 'public_web', now(), now()
from s
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-029 NinaJiaStudio
with s as (select id from shops where shop_code='SHOP-029')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, '4486251915', 'https://www.etsy.com/listing/4486251915/vintage-floral-jacquard-makeup-bag-large',
'Vintage Floral Jacquard Makeup Bag, Large Travel Cosmetic Pouch, Elegant Toiletry Organizer','Bags','active','makeup_bag',
array['vintage','floral','jacquard','oriental'],array['polyester','canvas'],array[]::text[],
array['Textile Bags','Vintage Makeup Bags'], 'Giftable Accessories', true, 'public_web', now(), now()
from s
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-030 Chtte
with s as (select id from shops where shop_code='SHOP-030')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Home Textiles & Comfort', true, 'public_web', now(), now()
from s cross join (values
('4440783510','https://www.etsy.com/listing/4440783510/u-shaped-chair-cushion-linen-blend-seat','U Shaped Chair Cushion, Linen Blend Seat Pad, High Density Foam Dining Pad','Chair Pads','chair_pad',array['minimal','oriental','natural'],array['linen','cotton','polyester'],array['dining_room','kitchen','tea_room'],array['Chair Cushions & Seat Pads']::text[]),
('4325858718','https://www.etsy.com/listing/4325858718/royal-blue-floral-cotton-fabric','Royal Blue Floral Cotton Fabric: Victorian Style Botanical Print','Fabric','printed_fabric',array['victorian','floral','botanical'],array['cotton'],array['living_room','bedroom'],array['Linen & Cotton Fabric','Sewing & Couture Fabric']::text[])
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

do $$
declare c integer;
begin
  select count(*) into c from products
  where shop_id in (select id from shops where shop_code between 'SHOP-023' and 'SHOP-030');
  if c < 18 then
    raise exception 'SHOP-023..030 import incomplete: expected at least 18 product rows, found %', c;
  end if;
end $$;
