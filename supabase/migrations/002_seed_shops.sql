-- Seed initial 30 Etsy shops
-- 002_seed_shops.sql

insert into shops (shop_code, shop_name, etsy_shop_url, batch, status) values
('SHOP-001','Parkermo','https://www.etsy.com/shop/Parkermo',1,'active'),
('SHOP-002','WOGOL','https://www.etsy.com/shop/WOGOL',1,'active'),
('SHOP-003','DanyHomeDesign','https://www.etsy.com/shop/DanyHomeDesign',1,'active'),
('SHOP-004','ShirieHomeShow','https://www.etsy.com/shop/ShirieHomeShow',1,'active'),
('SHOP-005','SobiaStudio','https://www.etsy.com/shop/SobiaStudio',1,'active'),
('SHOP-006','AmyHomeCrafts','https://www.etsy.com/shop/AmyHomeCrafts',1,'active'),
('SHOP-007','CustomCurtainsStudio','https://www.etsy.com/shop/CustomCurtainsStudio',2,'active'),
('SHOP-008','LambertHouse','https://www.etsy.com/shop/LambertHouse',2,'active'),
('SHOP-009','KoltCraftStudio','https://www.etsy.com/shop/KoltCraftStudio',2,'active'),
('SHOP-010','WoodHomeLiang','https://www.etsy.com/shop/WoodHomeLiang',2,'active'),
('SHOP-011','NiceCraftStudioHK','https://www.etsy.com/shop/NiceCraftStudioHK',2,'active'),
('SHOP-012','GavinHome','https://www.etsy.com/shop/GavinHome',2,'active'),
('SHOP-013','ChicDecorHK','https://www.etsy.com/shop/ChicDecorHK',2,'active'),
('SHOP-014','FrenchStyleDecor','https://www.etsy.com/shop/FrenchStyleDecor',2,'active'),
('SHOP-015','Adamideal','https://www.etsy.com/shop/Adamideal',3,'active'),
('SHOP-016','beou','https://www.etsy.com/shop/beou',3,'active'),
('SHOP-017','MiawoodStudio','https://www.etsy.com/shop/MiawoodStudio',3,'active'),
('SHOP-018','HeyDream','https://www.etsy.com/shop/HeyDream',3,'active'),
('SHOP-019','KorusStore','https://www.etsy.com/shop/KorusStore',3,'active'),
('SHOP-020','CellaHo','https://www.etsy.com/shop/CellaHo',3,'active'),
('SHOP-021','TunaMunStudio','https://www.etsy.com/shop/TunaMunStudio',4,'active'),
('SHOP-022','LoomGoStudio','https://www.etsy.com/shop/LoomGoStudio',4,'active'),
('SHOP-023','HibiChStudio','https://www.etsy.com/shop/HibiChStudio',4,'active'),
('SHOP-024','PearlsTreasuresArt','https://www.etsy.com/shop/PearlsTreasuresArt',4,'active'),
('SHOP-025','QuGifts','https://www.etsy.com/shop/QuGifts',4,'active'),
('SHOP-026','NngGoods','https://www.etsy.com/shop/NngGoods',4,'active'),
('SHOP-027','MiraKiuStudio','https://www.etsy.com/shop/MiraKiuStudio',4,'active'),
('SHOP-028','StellaGoodsGifts','https://www.etsy.com/shop/StellaGoodsGifts',4,'active'),
('SHOP-029','NinaJiaStudio','https://www.etsy.com/shop/NinaJiaStudio',4,'active'),
('SHOP-030','Chtte','https://www.etsy.com/shop/Chtte',5,'active')
on conflict (shop_code) do update set
shop_name = excluded.shop_name,
etsy_shop_url = excluded.etsy_shop_url,
batch = excluded.batch;
