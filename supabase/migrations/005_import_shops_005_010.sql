-- 005_import_shops_005_010.sql
-- Product-level import for SHOP-005 through SHOP-010 from public Etsy listing pages.

-- SHOP-005 SobiaStudio
with s as (select id from shops where shop_code='SHOP-005')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Romantic / French / Cottage Home', true, 'public_web', now(), now()
from s cross join (values
('4366214891','https://www.etsy.com/listing/4366214891/white-lace-tie-up-curtain-floral','Lace Tie-up Curtain, Floral Embroidered Sheer Drape With Ruffle, Adjustable Balloon Curtain','Curtains','tie_up_curtain',array['lace','embroidered','romantic','ruffle'],array[]::text[],array['bedroom','living_room'],array['Tie-Up & Balloon Shades','Embroidered Curtains','French Country Curtains']::text[])
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-006 AmyHomeCrafts
with s as (select id from shops where shop_code='SHOP-006')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, v.fb, true, 'public_web', now(), now()
from s cross join (values
('1436043433','https://www.etsy.com/listing/1436043433/elegant-white-lace-tablecloth-cotton','Elegant Lace Embroidery Tablecloth: Cotton Wedding Table Cover','Table Linens','tablecloth',array['lace','embroidered','romantic','wedding'],array['cotton'],array['dining_room'],array['Table Linens','French Country Home']::text[],'Home Textiles & Comfort'),
('1737407522','https://www.etsy.com/listing/1737407522/floral-print-cotton-linen-curtain','Floral Print Cotton Linen Curtain: Farmhouse Semi-Blackout Drape','Curtains','semi_blackout_curtain',array['floral','farmhouse','botanical'],array['cotton','linen'],array['living_room','bedroom'],array['Floral Curtains','Farmhouse Curtains','Linen Curtains']::text[],'Curtains & Window Styling'),
('4365683163','https://www.etsy.com/listing/4365683163/white-cotton-cafe-curtain-3d-floral','Cotton Cafe Curtain, 3D Floral Window Valance, Rod Pocket Kitchen Window Panel','Curtains','cafe_curtain',array['floral','romantic'],array['cotton'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Floral Curtains']::text[],'Curtains & Window Styling'),
('4365977435','https://www.etsy.com/listing/4365977435/shabby-chic-embroidered-lace-curtains','Shabby Chic Embroidered Lace Curtains, Romantic Floral Window Treatment','Curtains','sheer_curtain',array['shabby_chic','lace','embroidered','romantic'],array[]::text[],array['bedroom','living_room'],array['Sheer Curtains','Embroidered Curtains','French Country Curtains']::text[],'Romantic / French / Cottage Home'),
('1527006905','https://www.etsy.com/listing/1527006905/rococo-white-floral-embroidered-lace','Rococo Floral Embroidered Lace Curtain With Ruffles','Curtains','sheer_curtain',array['rococo','lace','embroidered','ruffle'],array[]::text[],array['bedroom','living_room'],array['Sheer Curtains','Embroidered Curtains','French Country Curtains']::text[],'Romantic / French / Cottage Home'),
('4323894263','https://www.etsy.com/listing/4323894263/vintage-floral-lace-curtain-sheer','Vintage Floral Lace Curtain: Sheer Embroidered Window Treatment','Curtains','sheer_curtain',array['vintage','floral','lace','embroidered'],array[]::text[],array['bedroom','living_room'],array['Sheer Curtains','Floral Curtains','Embroidered Curtains']::text[],'Curtains & Window Styling'),
('4417682544','https://www.etsy.com/listing/4417682544/white-embroidered-curtain-cotton-semi','Embroidered Curtain, Cotton Semi-Sheer Short Valance for Small Window','Curtains','valance',array['embroidered','romantic'],array['cotton'],array['kitchen','bathroom'],array['Cafe Curtains','Kitchen Curtains','Embroidered Curtains']::text[],'Curtains & Window Styling'),
('4419626490','https://www.etsy.com/listing/4419626490/white-floral-chair-pad-shabyy-chic','Elegant Floral Chair Pad, Shabby Chic Cotton Seat Cushion With Ruffled','Chair Pads','chair_pad',array['floral','shabby_chic','ruffle'],array['cotton'],array['dining_room','kitchen'],array['Chair Cushions & Seat Pads','French Country Home']::text[],'Home Textiles & Comfort')
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards,fb)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-007 CustomCurtainsStudio
with s as (select id from shops where shop_code='SHOP-007')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, v.fb, true, 'public_web', now(), now()
from s cross join (values
('1739543167','https://www.etsy.com/listing/1739543167/beige-tie-up-valance-for','Tie Up Valance for Windows, Adjustable Crochet Light Filtering Tie-up Shade Valance','Curtains','tie_up_curtain',array['boho','crochet','romantic'],array['cotton','polyester'],array['kitchen','bedroom'],array['Tie-Up & Balloon Shades','Cafe Curtains']::text[],'Curtains & Window Styling'),
('4432312297','https://www.etsy.com/listing/4432312297/vintage-crochet-tablecloth-beige','Vintage Crochet Tablecloth, Rectangle Table Cover, Bohemian Table Cloth','Table Linens','tablecloth',array['vintage','crochet','boho'],array[]::text[],array['dining_room'],array['Table Linens','Boho Home Decor']::text[],'Home Textiles & Comfort'),
('1864054150','https://www.etsy.com/listing/1864054150/vintage-style-beige-embroidered-curtain','Vintage-style Embroidered Curtain: Crochet Patchwork Window Drape','Curtains','full_length_curtain',array['vintage','embroidered','crochet','patchwork'],array[]::text[],array['living_room','bedroom'],array['Embroidered Curtains','French Country Curtains']::text[],'Romantic / French / Cottage Home'),
('1723269690','https://www.etsy.com/listing/1723269690/check-patchwork-sheer-curtainfarmhouse','Check Patchwork Sheer Curtain, Farmhouse Light Filtering Crochet Drapes','Curtains','sheer_curtain',array['checkered','patchwork','farmhouse','crochet'],array[]::text[],array['bedroom','living_room'],array['Sheer Curtains','Farmhouse Curtains']::text[],'Curtains & Window Styling'),
('4320366785','https://www.etsy.com/listing/4320366785/crochet-tablecloth-vintage-square','Crochet Tablecloth, Vintage Square Knitted Hollow Sofa Slipcover','Table Linens','tablecloth',array['vintage','crochet','boho'],array['cotton','polyester'],array['living_room','dining_room'],array['Table Linens','Boho Home Decor']::text[],'Home Textiles & Comfort'),
('1792567511','https://www.etsy.com/listing/1792567511/bohemian-linen-textrue-curtain-green','Bohemian Linen Texture Curtain, Elegant Leaf Light Filtering Window Drapes','Curtains','full_length_curtain',array['boho','botanical','natural'],array['linen'],array['living_room'],array['Linen Curtains','Floral Curtains']::text[],'Curtains & Window Styling')
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards,fb)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-008 LambertHouse
with s as (select id from shops where shop_code='SHOP-008')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Hangers', 'active', v.product_type, v.style_tags, v.material_tags, array['closet']::text[], v.boards, 'Closet & Home Organization', true, 'public_web', now(), now()
from s cross join (values
('1893519997','https://www.etsy.com/listing/1893519997/luxury-kids-hangers-aluminum-alloy-no','Luxury Kids Hangers: Aluminum Alloy, No-Slip, Curved Design','kids_hanger',array['modern','minimal'],array['aluminum'],array['Closet Organization']::text[]),
('1775126898','https://www.etsy.com/listing/1775126898/gold-aluminum-alloy-coat-hangers-wide','Gold Aluminum Alloy Coat Hangers - Wide Shoulder, Heavy Duty','coat_hanger',array['modern','luxury'],array['aluminum'],array['Closet Organization']::text[]),
('1803029273','https://www.etsy.com/listing/1803029273/gold-aluminum-open-ended-pants-hangers','Gold Aluminum Open Ended Pants Hangers - Non-Slip Trousers & Scarf Hangers','pants_hanger',array['modern','minimal'],array['aluminum'],array['Closet Organization']::text[]),
('1893428301','https://www.etsy.com/listing/1893428301/aluminum-alloy-clothes-hangers-curved','Aluminum Alloy Clothes Hangers: Curved Shoulder, Non-Slip Metal Hangers','clothes_hanger',array['modern','minimal'],array['aluminum'],array['Closet Organization']::text[]),
('1787372056','https://www.etsy.com/listing/1787372056/510-pcs-premium-gold-aluminum-coat','Gold Aluminum Alloy Clothes Hangers, Premium Metal Suit Hangers','suit_hanger',array['modern','luxury'],array['aluminum'],array['Closet Organization']::text[]),
('1893340909','https://www.etsy.com/listing/1893340909/aluminum-alloy-hangers-non-slip-u-shaped','Aluminum Alloy Hangers: Non-Slip U-Shaped Closet Organizer','clothes_hanger',array['modern','minimal'],array['aluminum'],array['Closet Organization']::text[]),
('1790815391','https://www.etsy.com/listing/1790815391/gold-aluminum-clothes-hangers-open-end','Gold Aluminum Clothes Hangers: Open End, Anti-Slip','pants_hanger',array['modern','luxury'],array['aluminum'],array['Closet Organization']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,pinterest_boards=excluded.pinterest_boards,
  facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-009 KoltCraftStudio
with s as (select id from shops where shop_code='SHOP-009')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, v.category, 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Closet & Home Organization', true, 'public_web', now(), now()
from s cross join (values
('1841132315','https://www.etsy.com/listing/1841132315/camphor-wood-clothes-hanger-with','Camphor Wood Clothes Hanger with Adjustable Trouser Clips','Hangers','pants_hanger',array['natural','classic'],array['camphor_wood','metal'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('1826865120','https://www.etsy.com/listing/1826865120/black-walnut-wood-coat-hanger-with-brass','Black Walnut Wood Coat Hanger With Brass Hook','Hangers','coat_hanger',array['luxury','classic'],array['walnut_wood','brass'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('1883704823','https://www.etsy.com/listing/1883704823/brown-wood-hangers-with-metal-bar-non','Brown Wood Hangers With Metal Bar: Non-Slip Suit & Dress Hangers','Hangers','suit_hanger',array['classic'],array['wood','metal'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('1836722296','https://www.etsy.com/listing/1836722296/vintage-wooden-pants-hangers-adjustable','Vintage Wooden Pants Hangers: Adjustable Grip Clips, Smooth Finish','Hangers','pants_hanger',array['vintage','classic'],array['wood','metal'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('1826811576','https://www.etsy.com/listing/1826811576/black-walnut-wood-hanger-non-slip-dress','Black Walnut Wood Hanger: Non-Slip Dress Hanger With Brass Hook','Hangers','dress_hanger',array['luxury','classic'],array['walnut_wood','brass'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('1795885573','https://www.etsy.com/listing/1795885573/wooden-hangers-with-non-slip-pant-bar','Solid Wood Hangers With Non-Slip Pant Bar','Hangers','suit_hanger',array['classic'],array['wood'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('1776683908','https://www.etsy.com/listing/1776683908/wide-shoulder-camphor-wood-suit-hangers','Wide Shoulder Camphor Wood Suit Hangers: 360 Swivel Hook','Hangers','suit_hanger',array['classic','luxury'],array['camphor_wood'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('1762833875','https://www.etsy.com/listing/1762833875/wide-shoulder-solid-wood-suit-hangers','Wide Shoulder Solid Wood Suit Hangers With Swivel Hook','Hangers','suit_hanger',array['classic'],array['wood'],array['closet'],array['Wooden Hangers','Closet Organization']::text[]),
('4434399589','https://www.etsy.com/listing/4434399589/walnut-wood-dental-floss-box-wooden','Walnut Wood Dental Floss Box, Wooden Double-Layer Cotton Swab Storage Container','Storage','storage_box',array['minimal','natural'],array['walnut_wood'],array['bathroom'],array['Wooden Home Organization','Bathroom Storage']::text[]),
('4385747137','https://www.etsy.com/listing/4385747137/minimalist-black-walnut-desktop','Minimalist Black Walnut Desktop Organizer, Key Holder With 4 Hooks','Storage','desktop_organizer',array['minimal','modern'],array['walnut_wood'],array['office','entryway'],array['Wooden Home Organization']::text[]),
('4451574935','https://www.etsy.com/listing/4451574935/solid-black-walnut-flip-top-storage-box','Solid Black Walnut Flip-top Storage Box, Wooden Jewelry & Document Organizer','Storage','storage_box',array['minimal','modern'],array['walnut_wood'],array['office','bedroom'],array['Wooden Home Organization']::text[])
) as v(listing_id,url,title,category,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,category=excluded.category,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-010 WoodHomeLiang
with s as (select id from shops where shop_code='SHOP-010')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Hangers', 'active', v.product_type, v.style_tags, v.material_tags, array['closet']::text[], v.boards, 'Closet & Home Organization', true, 'public_web', now(), now()
from s cross join (values
('4433497827','https://www.etsy.com/listing/4433497827/solid-wood-hanger-brass-hook-non-slip','Solid Wood Hanger, Brass Hook, Non-Slip Walnut/Beech Finish','clothes_hanger',array['scandinavian','minimal','natural'],array['walnut_wood','beech_wood','brass'],array['Wooden Hangers','Closet Organization']::text[]),
('1846382537','https://www.etsy.com/listing/1846382537/vintage-wooden-coat-hanger-walnut-finish','Vintage Wooden Coat Hanger: Walnut Finish, Rotating Hook & Pant Bar','coat_hanger',array['vintage','classic'],array['wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1383474987','https://www.etsy.com/listing/1383474987/handmade-wooden-branch-clothes-hanger','Handmade Wooden Branch Clothes Hanger, Natural Wood S Hook','branch_hanger',array['rustic','natural','handmade'],array['wood'],array['Wooden Hangers','Wooden Home Organization']::text[]),
('1863933464','https://www.etsy.com/listing/1863933464/natural-solid-wood-hangersfarmhouse','Natural Solid Wood Hangers, Farmhouse Brown Branch Clothes Hangers','branch_hanger',array['farmhouse','rustic','natural'],array['wood'],array['Wooden Hangers','Farmhouse Home Organization']::text[]),
('1698517856','https://www.etsy.com/listing/1698517856/360-degree-rotatable-rubber-wood-hanger','360-Degree Rotatable Rubber Wood Hanger, Adjustable Metal Clips Pants Hangers','pants_hanger',array['modern','functional'],array['rubber_wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1896704249','https://www.etsy.com/listing/1896704249/wide-shoulder-camphor-wood-hangers-suit','Wide Shoulder Solid Wood Hangers: Suit & Coat Hangers','suit_hanger',array['classic','luxury'],array['wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1853913189','https://www.etsy.com/listing/1853913189/black-walnut-coat-hanger-curved-design','Black Walnut Coat Hanger: Curved Design With Rotating Brass Hook','coat_hanger',array['luxury','classic'],array['walnut_wood','brass'],array['Wooden Hangers','Closet Organization']::text[]),
('1846378711','https://www.etsy.com/listing/1846378711/natural-wood-clothes-hanger-rustic-coat','Natural Wood Clothes Hanger, Rustic Coat Hanger','coat_hanger',array['rustic','natural'],array['wood'],array['Wooden Hangers','Closet Organization']::text[]),
('1769992796','https://www.etsy.com/listing/1769992796/8-hooks-closet-organizer-rack-for','8-Hooks Closet Organizer Rack for Ties, Natural Camphor Wood Tie Rack Hanger','tie_rack',array['natural','functional'],array['camphor_wood','metal'],array['Closet Organization','Wooden Home Organization']::text[]),
('1747740369','https://www.etsy.com/listing/1747740369/black-wood-pant-hanger-adjustable-alloy','Black Wood Pant Hanger: Adjustable Alloy Clips & Copper Hook','pants_hanger',array['modern','luxury'],array['wood','metal','copper'],array['Wooden Hangers','Closet Organization']::text[]),
('1853904591','https://www.etsy.com/listing/1853904591/black-walnut-wide-shoulder-hanger-luxury','Black Walnut Wide Shoulder Hanger: Luxury Brass Hook Coat & Suit Hanger','suit_hanger',array['luxury','classic'],array['walnut_wood','brass'],array['Wooden Hangers','Closet Organization']::text[]),
('1752546922','https://www.etsy.com/listing/1752546922/retro-wooden-pants-hanger-with-metal','Retro Wooden Pants Hanger With Metal Clips: Camphor Wood','pants_hanger',array['retro','classic'],array['camphor_wood','metal'],array['Wooden Hangers','Closet Organization']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,style_tags=excluded.style_tags,
  material_tags=excluded.material_tags,room_tags=excluded.room_tags,pinterest_boards=excluded.pinterest_boards,
  facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

do $$
declare c integer;
begin
  select count(*) into c from products
  where shop_id in (select id from shops where shop_code between 'SHOP-005' and 'SHOP-010');
  if c < 45 then
    raise exception 'SHOP-005..010 import incomplete: expected at least 45 product rows, found %', c;
  end if;
end $$;
