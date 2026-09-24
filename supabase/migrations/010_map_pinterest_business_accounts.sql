-- 010_map_pinterest_business_accounts.sql
-- Register user-provided Pinterest Business accounts and route current products.

alter table social_accounts
  add column if not exists profile_url text,
  add column if not exists handle text;

-- Register the five Pinterest Business accounts.
insert into social_accounts (platform, account_name, display_name, external_account_id, profile_url, handle, account_status, active, notes)
values
('pinterest','P1','CYNDI ZHANG',null,'https://www.pinterest.com/icyndizhang/','icyndizhang','pending',true,'Home Textiles & Curtains'),
('pinterest','P2','MIDOSHARK',null,'https://uk.pinterest.com/sailing_981/','sailing_981','pending',true,'Closet & Wood Organization'),
('pinterest','P3','Mydecorshop',null,'https://www.pinterest.com/mydecorshop/','mydecorshop','pending',true,'Fabrics & Sewing'),
('pinterest','P4','Cindy',null,'https://www.pinterest.com/cindyzhang62/','cindyzhang62','pending',true,'Coastal Decor & Jewelry'),
('pinterest','P5','Full House',null,'https://www.pinterest.com/ivy5205/','ivy5205','pending',true,'Hardware & Small Accessories')
on conflict (platform, account_name) do update set
  display_name=excluded.display_name,
  profile_url=excluded.profile_url,
  handle=excluded.handle,
  notes=excluded.notes,
  active=true;

-- Map shops to every Pinterest account they actually need based on current product routing.
with routed as (
  select distinct
    p.shop_id,
    case
      when p.category = 'Fabric'
        or p.product_type in ('printed_fabric','embroidered_fabric','jacquard_fabric','lace_fabric','silk_organza','silk_brocade','embroidered_organza')
        then 'P3'
      when p.category = 'Jewelry'
        or p.shop_id in (select id from shops where shop_code in ('SHOP-024','SHOP-025'))
        then 'P4'
      when p.category in ('Hardware','Bags')
        or p.shop_id in (select id from shops where shop_code in ('SHOP-026','SHOP-029'))
        then 'P5'
      when p.category in ('Hangers','Storage','DIY Wood')
        or p.shop_id in (select id from shops where shop_code in ('SHOP-008','SHOP-009','SHOP-010','SHOP-015','SHOP-017','SHOP-023'))
        then 'P2'
      else 'P1'
    end as account_name
  from products p
),
accounts as (
  select id, account_name
  from social_accounts
  where platform='pinterest'
)
insert into shop_social_accounts (shop_id, social_account_id, platform, active, is_default, mapped_at)
select r.shop_id, a.id, 'pinterest'::platform_type, true, false, now()
from routed r
join accounts a using (account_name)
on conflict (shop_id, social_account_id, platform) do update set
  active=true,
  mapped_at=excluded.mapped_at;

-- Route each current Pinterest draft queue row to the appropriate account.
with routed_products as (
  select
    p.id as product_id,
    case
      when p.category = 'Fabric'
        or p.product_type in ('printed_fabric','embroidered_fabric','jacquard_fabric','lace_fabric','silk_organza','silk_brocade','embroidered_organza')
        then 'P3'
      when p.category = 'Jewelry'
        or p.shop_id in (select id from shops where shop_code in ('SHOP-024','SHOP-025'))
        then 'P4'
      when p.category in ('Hardware','Bags')
        or p.shop_id in (select id from shops where shop_code in ('SHOP-026','SHOP-029'))
        then 'P5'
      when p.category in ('Hangers','Storage','DIY Wood')
        or p.shop_id in (select id from shops where shop_code in ('SHOP-008','SHOP-009','SHOP-010','SHOP-015','SHOP-017','SHOP-023'))
        then 'P2'
      else 'P1'
    end as account_name
  from products p
),
accounts as (
  select id, account_name from social_accounts where platform='pinterest'
)
update publish_queue q
set social_account_id = a.id
from routed_products rp
join accounts a on a.account_name = rp.account_name
where q.product_id = rp.product_id
  and q.platform = 'pinterest'
  and q.status = 'draft';

-- Keep everything draft until account authorization is completed.
update social_accounts
set account_status='pending'
where platform='pinterest' and account_name in ('P1','P2','P3','P4','P5');

do $$
declare
  account_count integer;
  routed_count integer;
  pin_queue_count integer;
begin
  select count(*) into account_count
  from social_accounts
  where platform='pinterest' and account_name in ('P1','P2','P3','P4','P5');

  select count(*) into pin_queue_count
  from publish_queue
  where platform='pinterest';

  select count(*) into routed_count
  from publish_queue
  where platform='pinterest' and social_account_id is not null;

  if account_count <> 5 then
    raise exception 'Pinterest account registry incomplete: expected 5, found %', account_count;
  end if;

  if routed_count <> pin_queue_count then
    raise exception 'Pinterest routing incomplete: queue %, routed %', pin_queue_count, routed_count;
  end if;
end $$;
