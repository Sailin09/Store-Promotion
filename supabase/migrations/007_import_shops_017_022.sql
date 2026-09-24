-- 007_import_shops_017_022.sql
-- Product-level import for SHOP-017 through SHOP-022 from public Etsy listing pages.

-- SHOP-017 MiawoodStudio
with s as (select id from shops where shop_code='SHOP-017')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Hangers', 'active', v.product_type, v.style_tags, v.material_tags, array['closet']::text[], v.boards, 'Closet & Home Organization', true, 'public_web', now(), now()
from s cross join (values
('1863038510','https://www.etsy.com/listing/1863038510/wide-shoulder-wooden-hanger-curved-suit','Wide Shoulder Wooden Hanger: Curved Suit & Coat Organizer','suit_hanger',array['classic','luxury'],array['wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1284508718','https://www.etsy.com/listing/1284508718/black-walnut-brass-hanger-solid-wood','Black Walnut & Brass Hanger: Solid Wood Adult/Child Sizes','clothes_hanger',array['minimal','luxury'],array['walnut_wood','brass'],array['Wooden Hangers','Closet Organization']::text[]),
('1302262396','https://www.etsy.com/listing/1302262396/black-walnut-wood-clothes-hanger-brass','Black Walnut Wood Clothes Hanger: Brass Hook, Non-Slip','clothes_hanger',array['minimal','luxury'],array['walnut_wood','brass'],array['Wooden Hangers','Closet Organization']::text[]),
('1447491091','https://www.etsy.com/listing/1447491091/personalized-walnut-wood-hanger-engraved','Personalized Walnut Wood Hanger – Engraved Brass Hook, Wedding Gift','personalized_hanger',array['wedding','personalized','luxury'],array['walnut_wood','brass'],array['Wooden Hangers','Wedding Hangers']::text[]),
('1781803827','https://www.etsy.com/listing/1781803827/vintage-walnut-round-hanger-360-degree','Vintage Walnut Round Hanger - 360-Degree Swivel Metal Hook','round_hanger',array['vintage','functional'],array['walnut_wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1863045130','https://www.etsy.com/listing/1863045130/black-walnut-wood-hanger-with-brass-hook','Black Walnut Wood Hanger with Brass Hook: Wide Shoulder Suit Hanger','suit_hanger',array['classic','luxury'],array['walnut_wood','brass'],array['Wooden Hangers','Closet Organization']::text[]),
('1877238171','https://www.etsy.com/listing/1877238171/black-walnut-wood-suit-hanger-with-pant','Black Walnut Wood Suit Hanger With Pant Bar & Black Hook','suit_hanger',array['modern','luxury'],array['walnut_wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1877231797','https://www.etsy.com/listing/1877231797/camphor-wood-wide-shoulder-hanger','Camphor Wood Wide Shoulder Hanger: Elegant Coat & Suit Organizer','suit_hanger',array['classic','natural'],array['camphor_wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1877309389','https://www.etsy.com/listing/1877309389/camphor-wood-wide-shoulder-hanger','Camphor Wood Wide-Shoulder Hanger: Champagne Gold Hook, Satin Finish','suit_hanger',array['luxury','classic'],array['camphor_wood','metal'],array['Wooden Hangers','Closet Organization']::text[]),
('1877240709','https://www.etsy.com/listing/1877240709/black-walnut-wood-hanger-curved-suit','Black Walnut Wood Hanger: Curved Suit & Coat Organizer with Brass Hook','suit_hanger',array['classic','luxury'],array['walnut_wood','brass'],array['Wooden Hangers','Closet Organization']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-018 HeyDream
with s as (select id from shops where shop_code='SHOP-018')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, '1796483506', 'https://www.etsy.com/listing/1796483506/french-rococo-ruffle-lace-curtain-sheer',
'French Rococo Ruffle Lace Curtain: Sheer Balcony Decor','Curtains','active','sheer_curtain',
array['french_style','rococo','ruffle','lace'],array['lace'],array['bedroom','living_room','balcony'],
array['Sheer Curtains','French Country Curtains'], 'Romantic / French / Cottage Home', true, 'public_web', now(), now()
from s
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-019 KorusStore
with s as (select id from shops where shop_code='SHOP-019')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Curtains', 'active', v.product_type, v.style_tags, v.material_tags, array['living_room','bedroom']::text[], v.boards, 'Curtains & Window Styling', true, 'public_web', now(), now()
from s cross join (values
('1697227283','https://www.etsy.com/listing/1697227283/vintage-botanical-jacquard-blackout','Vintage Botanical Jacquard Blackout Curtain: Beige Gray Chenille','blackout_curtain',array['vintage','botanical','jacquard'],array['chenille'],array['Blackout Curtains','Floral Curtains']::text[]),
('1697773621','https://www.etsy.com/listing/1697773621/vintage-floral-curtains-customizable','Vintage Floral Curtains: Customizable Cottagecore Bedroom Drapes','full_length_curtain',array['vintage','floral','cottagecore'],array[]::text[],array['Floral Curtains','Cottagecore Curtains']::text[]),
('1311051679','https://www.etsy.com/listing/1311051679/modern-living-room-curtain-baroque-style','Modern Living Room Curtain, Baroque Style Large Floral Pattern','full_length_curtain',array['baroque','floral','elegant'],array['cotton','linen'],array['Floral Curtains']::text[]),
('1311056433','https://www.etsy.com/listing/1311056433/tropical-leaf-print-curtains-golden','Tropical Leaf Print Curtains: Golden Brown Botanical Drapes','full_length_curtain',array['tropical','botanical','natural'],array['cotton','linen'],array['Floral Curtains']::text[]),
('1302160044','https://www.etsy.com/listing/1302160044/teal-botanical-curtains-custom-floral','Teal Botanical Curtains: Custom Floral Bedroom & Living Room Decor','full_length_curtain',array['botanical','floral'],array[]::text[],array['Floral Curtains','Custom Curtains']::text[]),
('1639723092','https://www.etsy.com/listing/1639723092/floral-pattern-blackout-curtain-vintage','Floral Pattern Blackout Curtain: Vintage Bedroom Living Room Drapes','blackout_curtain',array['vintage','floral'],array['blended'],array['Blackout Curtains','Floral Curtains']::text[]),
('4405728873','https://www.etsy.com/listing/4405728873/black-jacquard-chenille-curtains','Black Jacquard Chenille Curtains, Botanical Blackout Window Drapes','blackout_curtain',array['jacquard','botanical','luxury'],array['chenille'],array['Blackout Curtains','Floral Curtains']::text[]),
('1697366539','https://www.etsy.com/listing/1697366539/blue-green-leaf-print-curtains-cotton','Blue & Green Leaf Print Curtains: Cotton-Linen Blend, Custom Size','semi_blackout_curtain',array['botanical','country'],array['cotton','linen'],array['Floral Curtains','Custom Curtains']::text[]),
('1302152874','https://www.etsy.com/listing/1302152874/orange-botanical-jacquard-curtains','Orange Botanical Jacquard Curtains: Natural Style, Custom Size','full_length_curtain',array['botanical','jacquard','natural'],array[]::text[],array['Floral Curtains','Custom Curtains']::text[]),
('1892822667','https://www.etsy.com/listing/1892822667/oriental-landscape-print-curtains','Oriental Landscape Print Curtains: Vintage Asian Garden Drapes','full_length_curtain',array['oriental','landscape','vintage'],array[]::text[],array['Custom Curtains','Asian Style Curtains']::text[]),
('1681233657','https://www.etsy.com/listing/1681233657/green-leaf-blackout-curtains-country','Green Leaf Blackout Curtains: Country Style Bedroom & Living Room','blackout_curtain',array['country','botanical'],array['chenille'],array['Blackout Curtains','Floral Curtains']::text[]),
('1718517321','https://www.etsy.com/listing/1718517321/victorian-floral-curtains-custom-printed','Victorian Floral Curtains: Custom Printed, Elegant Blue Bedroom Decor','full_length_curtain',array['victorian','floral','classic'],array['linen','cotton'],array['Floral Curtains','Custom Curtains']::text[]),
('1270924141','https://www.etsy.com/listing/1270924141/floral-bird-pattern-curtain-rustic','Floral Bird Pattern Curtain: Rustic Countryside Bedroom Decor','blackout_curtain',array['rustic','floral','bird'],array['chenille'],array['Blackout Curtains','Floral Curtains']::text[]),
('1340978253','https://www.etsy.com/listing/1340978253/botanical-print-curtains-country-garden','Botanical Print Curtains: Country Garden Living Room Decor','full_length_curtain',array['botanical','country','garden'],array['blended'],array['Floral Curtains']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-020 CellaHo
with s as (select id from shops where shop_code='SHOP-020')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Fabric', 'active', v.product_type, v.style_tags, v.material_tags, array[]::text[], v.boards, 'Fabrics & Makers', true, 'public_web', now(), now()
from s cross join (values
('4396132405','https://www.etsy.com/listing/4396132405/white-embroidered-cotton-fabric55in-wide','White Embroidered Cotton Fabric, Floral Fabric, DIY Sewing & Home Decor','embroidered_fabric',array['floral','embroidered','minimal'],array['cotton'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[]),
('1832656370','https://www.etsy.com/listing/1832656370/floral-embroidered-jacquard-fabric','Floral Embroidered Jacquard Fabric: Lightweight Cotton Polyester Blend','jacquard_fabric',array['floral','embroidered'],array['cotton','polyester'],array['Embroidered Fabric','Jacquard Fabric']::text[]),
('1846855145','https://www.etsy.com/listing/1846855145/floral-embroidered-linen-fabric','Floral Embroidered Linen Fabric: Lightweight Sewing Material','embroidered_fabric',array['floral','vintage','embroidered'],array['linen'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[]),
('4365149143','https://www.etsy.com/listing/4365149143/boho-paisley-lace-fabric-embroidered','Boho Paisley Lace Fabric: Embroidered Cotton Thread, Sheer Wedding Material','lace_fabric',array['boho','paisley','embroidered'],array['lace','cotton','polyester'],array['Embroidered Fabric','Sewing & Couture Fabric']::text[]),
('4432320593','https://www.etsy.com/listing/4432320593/embroidered-cat-fabric-diy-cotton-linen','Embroidered Cat Fabric, DIY Cotton Linen Material for Cushions, Bags & Curtains','embroidered_fabric',array['cat','japanese','korean'],array['cotton'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[]),
('1538620317','https://www.etsy.com/listing/1538620317/embroidered-floral-cotton-linen-fabric','Embroidered Floral Cotton Linen Fabric: Retro Curtain & Tablecloth Material','embroidered_fabric',array['floral','retro','embroidered'],array['cotton'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[]),
('4368683284','https://www.etsy.com/listing/4368683284/embroidered-denim-blue-cotton-fabric','Embroidered Denim Blue Cotton Fabric: Floral Soft Drapey Material','embroidered_fabric',array['floral','embroidered'],array['cotton'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[]),
('4367385017','https://www.etsy.com/listing/4367385017/white-3d-embroidered-floral-lace-chiffon','White 3D Embroidered Floral Lace Chiffon Mesh Fabric','lace_fabric',array['floral','3d','bridal','romantic'],array['lace','chiffon'],array['Embroidered Fabric','Sewing & Couture Fabric']::text[]),
('1839182756','https://www.etsy.com/listing/1839182756/black-cotton-fabric-white-floral','Black Cotton Fabric: White Floral Embroidery, Elegant Dress Material','embroidered_fabric',array['floral','embroidered'],array['cotton'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[]),
('1538587663','https://www.etsy.com/listing/1538587663/green-embroidered-cotton-fabric-floral','Green Embroidered Cotton Fabric, Floral Pattern','embroidered_fabric',array['floral','embroidered'],array['cotton'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[]),
('1832654442','https://www.etsy.com/listing/1832654442/vintage-yellow-floral-embroidered-cotton','Vintage Yellow Floral Embroidered Cotton Fabric','embroidered_fabric',array['vintage','floral','embroidered'],array['cotton'],array['Embroidered Fabric','Linen & Cotton Fabric']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-021 TunaMunStudio
with s as (select id from shops where shop_code='SHOP-021')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Curtains', 'active', v.product_type, v.style_tags, v.material_tags, v.room_tags, v.boards, 'Curtains & Window Styling', true, 'public_web', now(), now()
from s cross join (values
('4391064776','https://www.etsy.com/listing/4391064776/embroidered-balloon-shade-curtain','Embroidered Balloon Shade Curtain, Farmhouse Floral Tie Up Shade','tie_up_curtain',array['farmhouse','floral','embroidered','french_country'],array['polyester'],array['kitchen','bedroom'],array['Tie-Up & Balloon Shades','Farmhouse Curtains','Embroidered Curtains']::text[]),
('4374365692','https://www.etsy.com/listing/4374365692/floral-embroidered-cafe-curtain-rustic','Floral Embroidered Cafe Curtain, Rustic Kitchen Window Drapes, Farmhouse Valance Curtain','cafe_curtain',array['floral','embroidered','rustic','farmhouse'],array['cotton','linen'],array['kitchen'],array['Cafe Curtains','Kitchen Curtains','Farmhouse Curtains']::text[]),
('4418023334','https://www.etsy.com/listing/4418023334/embroidered-birds-linen-curtain-boho','Embroidered Birds Linen Curtain, Boho Window Panel for Living Room Bedroom','full_length_curtain',array['bird','embroidered','boho'],array['cotton','linen'],array['living_room','bedroom'],array['Linen Curtains','Embroidered Curtains']::text[]),
('4443064499','https://www.etsy.com/listing/4443064499/vintage-embroidered-sheer-curtains','Vintage Embroidered Sheer Curtains, Farmhouse Leaf Pattern Light Filtering Window Drapes','sheer_curtain',array['vintage','embroidered','farmhouse','botanical'],array['polyester'],array['living_room','bedroom','balcony'],array['Sheer Curtains','Embroidered Curtains','Farmhouse Curtains']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,room_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,room_tags=excluded.room_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

-- SHOP-022 LoomGoStudio
with s as (select id from shops where shop_code='SHOP-022')
insert into products (shop_id, etsy_listing_id, etsy_url, title, category, listing_status, product_type, style_tags, material_tags, room_tags, pinterest_boards, facebook_cluster, evergreen_eligible, source_type, source_discovered_at, last_seen_at)
select s.id, v.listing_id, v.url, v.title, 'Fabric', 'active', v.product_type, v.style_tags, v.material_tags, array[]::text[], v.boards, 'Fabrics & Makers', true, 'public_web', now(), now()
from s cross join (values
('4366040480','https://www.etsy.com/listing/4366040480/mulberry-silk-organza-fabric-chinese','Mulberry Silk Organza Fabric: Chinese Pavilion Embroidery, Sheer Hanfu Material','silk_organza',array['chinese','landscape','embroidered','hanfu'],array['silk'],array['Silk & Organza Fabric','Sewing & Couture Fabric']::text[]),
('4356345034','https://www.etsy.com/listing/4356345034/embroidered-mulberry-silk-organza-fabric','Embroidered Mulberry Silk Organza Fabric: Chinese Pavilion Landscape','silk_organza',array['chinese','landscape','embroidered'],array['silk'],array['Silk & Organza Fabric','Sewing & Couture Fabric']::text[]),
('4442572721','https://www.etsy.com/listing/4442572721/chinese-silk-embroidered-fabric-for-home','Chinese Silk Brocade Fabric, Landscape Embroidery, Sewing Material','silk_brocade',array['chinese','landscape','embroidered','brocade'],array['silk','rayon'],array['Jacquard Fabric','Sewing & Couture Fabric']::text[]),
('4416533490','https://www.etsy.com/listing/4416533490/pink-jacquard-fabric-embossed-texture','Pink Jacquard Fabric, Embossed Texture Textile, Vintage Cheongsam Coat Fabric','jacquard_fabric',array['chinese','cheongsam','vintage','embossed'],array['polyester'],array['Jacquard Fabric','Sewing & Couture Fabric']::text[]),
('4364578832','https://www.etsy.com/listing/4364578832/beige-floral-embroidered-organza-fabric','Beige Floral Embroidered Organza Fabric, Sheer Tulle Mesh','embroidered_organza',array['floral','embroidered','bridal'],array['organza'],array['Silk & Organza Fabric','Embroidered Fabric']::text[])
) as v(listing_id,url,title,product_type,style_tags,material_tags,boards)
on conflict (shop_id, etsy_listing_id) do update set
  etsy_url=excluded.etsy_url,title=excluded.title,product_type=excluded.product_type,
  style_tags=excluded.style_tags,material_tags=excluded.material_tags,
  pinterest_boards=excluded.pinterest_boards,facebook_cluster=excluded.facebook_cluster,last_seen_at=now();

do $$
declare c integer;
begin
  select count(*) into c from products
  where shop_id in (select id from shops where shop_code between 'SHOP-017' and 'SHOP-022');
  if c < 45 then
    raise exception 'SHOP-017..022 import incomplete: expected at least 45 product rows, found %', c;
  end if;
end $$;
