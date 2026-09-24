-- 006_import_shops_011_016.sql
-- Product-level import for SHOP-011 through SHOP-016 from public Etsy listing pages.

-- SHOP-011 NiceCraftStudioHK
with s as (select id from shops where shop_code='SHOP-011')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, v.fb, true, 'public_web', now(), now()
from s cross join (values
('1397614637','https://www.etsy.com/listing/1397614637/floral-embroidered-lace-table-runner','Floral Embroidered Lace Table Runner: French Style Wedding Decor','Table Linens','table_runner',array['floral','embroidered','lace','french_style'],array['polyester'],array['dining_room'],array['Table Linens','French Country Home']::text[],'Home Textiles & Comfort'),
('1676851479','https://www.etsy.com/listing/1676851479/elegant-floral-lace-tablecloth','Elegant Floral Lace Tablecloth: Embroidered Wedding Decor','Table Linens','tablecloth',array['floral','lace','romantic','vintage'],array['lace'],array['dining_room'],array['Table Linens','French Country Home']::text[],'Home Textiles & Comfort'),
('1717023528','https://www.etsy.com/listing/1717023528/white-lace-valance-elegant-floral','Floral Embroidered Sheer Curtain For Kitchen, Romantic Lace Valance','Curtains','valance',array['floral','embroidered','lace','romantic'],array['polyester'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Embroidered Curtains']::text[],'Curtains & Window Styling')
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards,fb)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-012 GavinHome
with s as (select id from shops where shop_code='SHOP-012')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Curtains', 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Romantic / French / Cottage Home', true, 'public_web', now(), now()
from s cross join (values
('1306867898','https://www.etsy.com/listing/1306867898/white-sheer-curtain-embroidered-floral','Romantic Sheer Curtain: Embroidered Floral Ruffles Drape, Rod Pocket','sheer_curtain',array['romantic','floral','embroidered','ruffle'],array['polyester'],array['bedroom','living_room'],array['Sheer Curtains','Embroidered Curtains','French Country Curtains']::text[]),
('1780825518','https://www.etsy.com/listing/1780825518/romantic-chiffon-ruffle-tie-up-curtain','Romantic Chiffon Ruffle Tie-Up Curtain: Adjustable Cafe Curtain','tie_up_curtain',array['romantic','ruffle'],array[]::text[],array['kitchen','bedroom'],array['Tie-Up & Balloon Shades','Cafe Curtains']::text[]),
('1413513702','https://www.etsy.com/listing/1413513702/white-embroidered-short-curtain-french','Romantic Embroidered Short Curtain | French Style Lace Sheer Curtain','cafe_curtain',array['french_style','embroidered','lace','romantic'],array['polyester'],array['bedroom','living_room','study'],array['Cafe Curtains','Embroidered Curtains','French Country Curtains']::text[]),
('1727267376','https://www.etsy.com/listing/1727267376/french-style-floral-tie-up-curtain','French Style Floral Tie-Up Curtain: Elegant Light Filtering Sheer Curtain','tie_up_curtain',array['french_style','floral','romantic'],array[]::text[],array['bedroom','living_room'],array['Tie-Up & Balloon Shades','Floral Curtains','French Country Curtains']::text[]),
('1781315456','https://www.etsy.com/listing/1781315456/floral-butterfly-sheer-curtain-romantic','Floral Butterfly Sheer Curtain: Romantic French Style Window Drape','sheer_curtain',array['floral','butterfly','romantic','french_style'],array['polyester'],array['bedroom','living_room'],array['Sheer Curtains','Floral Curtains','French Country Curtains']::text[]),
('1653857136','https://www.etsy.com/listing/1653857136/floral-lace-curtain-vintage-inspired','Floral Lace Curtain: Vintage-Inspired Sheer Drapes with Ruffle Edge','sheer_curtain',array['floral','lace','vintage','ruffle'],array['polyester'],array['bedroom','living_room'],array['Sheer Curtains','Floral Curtains','French Country Curtains']::text[]),
('1741943021','https://www.etsy.com/listing/1741943021/polka-dot-lace-valance-curtain-white','Polka Dot Lace Valance Curtain, Translucent Bow Edging Window Panel','valance',array['polka_dot','lace','romantic'],array['polyester'],array['kitchen','bedroom'],array['Cafe Curtains','French Country Curtains']::text[]),
('1628235211','https://www.etsy.com/listing/1628235211/white-embroidered-sheer-curtain-romantic','Embroidered Sheer Curtain: Romantic Ruffled Lace Light Filtering Drape','sheer_curtain',array['embroidered','romantic','ruffle','lace'],array[]::text[],array['living_room','bedroom'],array['Sheer Curtains','Embroidered Curtains','French Country Curtains']::text[]),
('1640142609','https://www.etsy.com/listing/1640142609/white-floral-sheer-valance-curtain','Floral Sheer Valance Curtain, Elegant Translucent Lace Window Curtain With Bow Edging','valance',array['floral','lace','romantic'],array[]::text[],array['kitchen','bedroom'],array['Cafe Curtains','Floral Curtains','French Country Curtains']::text[]),
('1781284786','https://www.etsy.com/listing/1781284786/french-style-embroidered-lace-curtain','French Style Embroidered Lace Curtain: Scalloped Valance, Arched Doorway Decor','door_curtain',array['french_style','embroidered','lace','scalloped'],array['polyester'],array['entryway','living_room'],array['Embroidered Curtains','French Country Curtains']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,pinterest_boards=excluded.pinterest_boards,
  facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-013 ChicDecorHK
with s as (select id from shops where shop_code='SHOP-013')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, v.fb, true, 'public_web', now(), now()
from s cross join (values
('1626539101','https://www.etsy.com/listing/1626539101/white-sheer-curtain-elegant-striped','Sheer Curtain, Elegant Striped Lightweight Filtering Window Curtain','Curtains','sheer_curtain',array['striped','minimal','elegant'],array['polyester'],array['bedroom','living_room'],array['Sheer Curtains','Bedroom Curtains']::text[],'Curtains & Window Styling'),
('1323643255','https://www.etsy.com/listing/1323643255/linen-tie-up-curtain-farmhouse-balloon','Linen Tie Up Curtain: Farmhouse Balloon Shade','Curtains','tie_up_curtain',array['farmhouse','natural'],array['linen'],array['kitchen','living_room'],array['Tie-Up & Balloon Shades','Farmhouse Curtains','Linen Curtains']::text[],'Curtains & Window Styling'),
('1721799800','https://www.etsy.com/listing/1721799800/handcrafted-scallop-shell-necklace-beach','Handcrafted Scallop Shell Necklace: Beach Style Ceramic Bead Jewelry','Jewelry','necklace',array['coastal','beach','shell'],array['shell','ceramic'],array[]::text[],array['Seashell Jewelry','Coastal Jewelry']::text[],'Coastal Decor & Jewelry')
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards,fb)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-014 FrenchStyleDecor
with s as (select id from shops where shop_code='SHOP-014')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Romantic / French / Cottage Home', true, 'public_web', now(), now()
from s cross join (values
('1715831642','https://www.etsy.com/listing/1715831642/linen-sheer-bed-canopy-romantic-ruffled','Elegant Sheer Bed Canopy: Romantic Ruffled Bedroom Drapery','Bed Canopy','bed_canopy',array['romantic','ruffle','french_style'],array['linen'],array['bedroom'],array['Bed Canopies','Romantic Bedding','French Country Home']::text[]),
('1491232780','https://www.etsy.com/listing/1491232780/ruffled-linen-texture-bed-canopy-4','Ruffled Linen Texture Bed Canopy: 4 Corners Post Curtain','Bed Canopy','bed_canopy',array['romantic','ruffle','french_style'],array['linen'],array['bedroom'],array['Bed Canopies','Romantic Bedding','French Country Home']::text[]),
('1681316864','https://www.etsy.com/listing/1681316864/vintage-floral-medallion-lace-curtain','Vintage Floral Medallion Lace Curtain: Elegant Semi-sheer Privacy','Curtains','sheer_curtain',array['vintage','floral','lace','romantic'],array[]::text[],array['bedroom','living_room'],array['Sheer Curtains','Floral Curtains','French Country Curtains']::text[]),
('1681211044','https://www.etsy.com/listing/1681211044/floral-lace-cafe-curtain-scalloped-edge','Floral Lace Cafe Curtain: Scalloped Edge Embroidered Cabinet Curtain','Curtains','cafe_curtain',array['floral','lace','embroidered','scalloped'],array[]::text[],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Embroidered Curtains']::text[]),
('1491248244','https://www.etsy.com/listing/1491248244/floral-embroidery-bed-canopy-shabby-chic','Floral Embroidery Bed Canopy: Shabby Chic Sheer Curtains','Bed Canopy','bed_canopy',array['floral','embroidered','shabby_chic','romantic'],array[]::text[],array['bedroom'],array['Bed Canopies','Romantic Bedding','French Country Home']::text[]),
('1323800588','https://www.etsy.com/listing/1323800588/embroidered-white-cotton-victorian-apron','Elegant Embroidered Cotton Victorian Apron With Lace','Aprons','apron',array['victorian','embroidered','lace','vintage'],array['cotton'],array['kitchen'],array['Vintage Aprons','French Country Home']::text[])
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-015 Adamideal
with s as (select id from shops where shop_code='SHOP-015')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Closet & Home Organization', true, 'public_web', now(), now()
from s cross join (values
('4449956852','https://www.etsy.com/listing/4449956852/desktop-power-strip-organizer-box-cable','Desktop Power Strip Organizer Box, Cable Management, Cable Concealer, Outlet Storage','Storage','cable_management_box',array['minimal','modern','functional'],array['wood','mdf','walnut_veneer'],array['office','living_room'],array['Wooden Home Organization']::text[]),
('1805037084','https://www.etsy.com/listing/1805037084/unfinished-briar-wood-pipe-kit-diy','Unfinished Briar Wood Pipe Kit, DIY Bulldog, Tulip Pipes, Half-finished Hammer Pipe','DIY Wood','diy_pipe_kit',array['handmade','diy','rustic'],array['briar_wood'],array[]::text[],array['Wooden DIY Projects']::text[])
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-016 beou
with s as (select id from shops where shop_code='SHOP-016')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, v.fb, true, 'public_web', now(), now()
from s cross join (values
('4432947002','https://www.etsy.com/listing/4432947002/cotton-quilted-sofa-cover-non-slip-couch','Sofa Cover, Non-Slip Embroidered Couch Protector','Sofa Covers','sofa_cover',array['minimal','embroidered','quilted'],array['cotton'],array['living_room'],array['Sofa Covers','Home Textiles']::text[],'Home Textiles & Comfort'),
('4425559908','https://www.etsy.com/listing/4425559908/rustic-tie-up-curtain-checkered-light','Rustic Tie-Up Curtain, Checkered Light-Filtering Balloon Curtain For Kitchen','Curtains','tie_up_curtain',array['rustic','checkered','japanese'],array['polyester'],array['kitchen'],array['Tie-Up & Balloon Shades','Kitchen Curtains','Farmhouse Curtains']::text[],'Curtains & Window Styling'),
('1341529845','https://www.etsy.com/listing/1341529845/farmhouse-sheer-pull-up-curtain-custom','Farmhouse Sheer Pull-Up Curtain: Custom Tie-Up Kitchen & Living Room','Curtains','tie_up_curtain',array['farmhouse','rustic'],array['blended'],array['kitchen','living_room'],array['Tie-Up & Balloon Shades','Farmhouse Curtains']::text[],'Curtains & Window Styling'),
('1752414600','https://www.etsy.com/listing/1752414600/custom-chenille-blackout-curtains','Custom Chenille Blackout Curtains: Vintage Floral Jacquard','Curtains','blackout_curtain',array['vintage','floral','jacquard'],array['chenille'],array['bedroom','living_room'],array['Blackout Curtains','Floral Curtains']::text[],'Curtains & Window Styling'),
('4473862388','https://www.etsy.com/listing/4473862388/boho-crochet-valance-linen-textured-tie','Boho Crochet Valance, Linen Textured Tie-Top Curtain, Farmhouse Kitchen Window Treatment','Curtains','valance',array['boho','crochet','farmhouse'],array['cotton','linen'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Farmhouse Curtains']::text[],'Curtains & Window Styling'),
('4513529763','https://www.etsy.com/listing/4513529763/natural-linen-chair-cushion-thick-square','Natural Linen Chair Cushion, Thick Square Seat Pad with Ties','Chair Pads','chair_pad',array['natural','minimal'],array['ramie','cotton'],array['dining_room','patio'],array['Chair Cushions & Seat Pads']::text[],'Home Textiles & Comfort'),
('4432976736','https://www.etsy.com/listing/4432976736/cotton-couch-coverwashable-sectional','Nordic Cotton Sofa Cover, Quilted Sectional Couch Slipcover','Sofa Covers','sofa_cover',array['nordic','minimal','quilted'],array['cotton'],array['living_room'],array['Sofa Covers','Home Textiles']::text[],'Home Textiles & Comfort'),
('4474318286','https://www.etsy.com/listing/4474318286/crochet-lace-tier-curtain-linen-blend','Crochet Lace Tier Curtain, Linen Blend Valance, Boho Farmhouse Kitchen Window Panel','Curtains','cafe_curtain',array['crochet','lace','boho','farmhouse'],array['linen','polyester'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Farmhouse Curtains']::text[],'Curtains & Window Styling'),
('4363072807','https://www.etsy.com/listing/4363072807/farmhouse-dining-chair-pad-with-ties','Farmhouse Dining Chair Pad with Ties: Tufted Cotton Linen Cushion','Chair Pads','chair_pad',array['farmhouse','tufted'],array['linen','cotton'],array['dining_room'],array['Chair Cushions & Seat Pads','Farmhouse Home Textiles']::text[],'Home Textiles & Comfort'),
('4403877330','https://www.etsy.com/listing/4403877330/striped-cotton-linen-chair-cushion','Striped Cotton Linen Chair Cushion, Minimalist Seat Pad With Ties','Chair Pads','chair_pad',array['striped','minimal'],array['cotton','linen'],array['dining_room'],array['Chair Cushions & Seat Pads']::text[],'Home Textiles & Comfort')
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards,fb)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

do $$
declare c integer;
begin
  select count(*) into c from products
  where shop_id in (select id from shops where shop_code between 'SHOP-011' and 'SHOP-016');
  if c < 34 then
    raise exception 'SHOP-011..016 import incomplete: expected at least 34 product rows, found %', c;
  end if;
end $$;
