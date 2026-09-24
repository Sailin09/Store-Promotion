-- 009_social_mapping_rules_and_initial_content_queue.sql
-- Prepare Pinterest/Facebook account mapping and generate initial content variants + draft queues.

-- Allow draft queue rows before a social account is mapped.
alter table publish_queue
  alter column social_account_id drop not null;

-- Add mapping/activation metadata.
alter table social_accounts
  add column if not exists display_name text,
  add column if not exists account_status text not null default 'pending',
  add column if not exists notes text;

alter table shop_social_accounts
  add column if not exists is_default boolean not null default false,
  add column if not exists mapped_at timestamptz;

create table if not exists promotion_rules (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid references shops(id) on delete cascade,
  platform platform_type not null,
  rule_name text not null,
  enabled boolean not null default true,
  max_posts_per_day integer not null default 1,
  min_gap_hours integer not null default 24,
  evergreen_reuse_days integer not null default 45,
  search_visible_priority_boost integer not null default 20,
  default_priority integer not null default 100,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(shop_id, platform, rule_name)
);

-- Conservative defaults: no automatic posting yet, one item/day/shop max after activation.
insert into promotion_rules (shop_id, platform, rule_name, max_posts_per_day, min_gap_hours, evergreen_reuse_days, notes)
select id, 'pinterest'::platform_type, 'default-organic', 1, 24, 45,
       'Draft-only until a Pinterest account is explicitly mapped. Use consumer-interest boards, not one board per Etsy shop.'
from shops
on conflict (shop_id, platform, rule_name) do nothing;

insert into promotion_rules (shop_id, platform, rule_name, max_posts_per_day, min_gap_hours, evergreen_reuse_days, notes)
select id, 'facebook'::platform_type, 'default-organic', 1, 24, 45,
       'Draft-only until a Facebook Page is explicitly mapped. Facebook copy should differ from Pinterest copy.'
from shops
on conflict (shop_id, platform, rule_name) do nothing;

-- Draft Pinterest content variant for every imported product.
insert into content_variants (
  shop_id, product_id, platform, creative_id, image_url, title, body,
  destination_url, board_or_category, content_type, version, status
)
select
  p.shop_id,
  p.id,
  'pinterest'::platform_type,
  'pin-v1',
  p.primary_image_url,
  left(coalesce(p.title,'Etsy product'), 100),
  trim(
    concat_ws(' ',
      coalesce(p.title,''),
      case when cardinality(p.style_tags) > 0 then 'Style: ' || array_to_string(p.style_tags, ', ') || '.' end,
      case when cardinality(p.material_tags) > 0 then 'Materials: ' || array_to_string(p.material_tags, ', ') || '.' end,
      'View details and available options on Etsy.'
    )
  ),
  p.etsy_url,
  coalesce(p.pinterest_boards[1], p.category, 'Etsy Finds'),
  'organic_pin',
  1,
  'draft'::content_status
from products p
on conflict (shop_id, product_id, platform, creative_id, version) do update set
  title = excluded.title,
  body = excluded.body,
  destination_url = excluded.destination_url,
  board_or_category = excluded.board_or_category,
  image_url = coalesce(excluded.image_url, content_variants.image_url);

-- Draft Facebook content variant for every imported product.
insert into content_variants (
  shop_id, product_id, platform, creative_id, image_url, title, body,
  destination_url, board_or_category, content_type, version, status
)
select
  p.shop_id,
  p.id,
  'facebook'::platform_type,
  'fb-v1',
  p.primary_image_url,
  left(coalesce(p.title,'Etsy product'), 120),
  trim(
    concat_ws(E'\n\n',
      coalesce(p.title,''),
      case
        when cardinality(p.style_tags) > 0
          then 'A closer look at this ' || replace(coalesce(p.product_type,p.category,'product'),'_',' ') ||
               ' with ' || array_to_string(p.style_tags, ', ') || ' details.'
        else 'A closer look at this item from our Etsy shop.'
      end,
      'See sizes, options and full details on Etsy: ' || p.etsy_url
    )
  ),
  p.etsy_url,
  coalesce(p.facebook_cluster, 'Etsy Products'),
  'organic_post',
  1,
  'draft'::content_status
from products p
on conflict (shop_id, product_id, platform, creative_id, version) do update set
  title = excluded.title,
  body = excluded.body,
  destination_url = excluded.destination_url,
  board_or_category = excluded.board_or_category,
  image_url = coalesce(excluded.image_url, content_variants.image_url);

-- Draft queue rows. social_account_id remains NULL until explicitly mapped.
insert into publish_queue (
  shop_id, product_id, content_variant_id, platform, social_account_id,
  scheduled_at, priority, status, retry_count
)
select
  cv.shop_id,
  cv.product_id,
  cv.id,
  cv.platform,
  null,
  null,
  case
    when p.evergreen_eligible then 100
    else 150
  end,
  'draft'::queue_status,
  0
from content_variants cv
join products p on p.id = cv.product_id
where cv.version = 1
  and cv.creative_id in ('pin-v1','fb-v1')
on conflict (shop_id, product_id, platform, content_variant_id) do nothing;

-- Safety: queue cannot become ready/scheduled/publishing without a mapped account.
create or replace function enforce_queue_account_before_activation()
returns trigger language plpgsql as $$
begin
  if new.status in ('ready','scheduled','publishing')
     and new.social_account_id is null then
    raise exception 'Cannot activate queue item without social_account_id';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_queue_requires_account on publish_queue;
create trigger trg_queue_requires_account
before insert or update on publish_queue
for each row execute function enforce_queue_account_before_activation();

-- Safety: mapped account platform must match queue platform and belong to the same shop mapping.
create or replace function enforce_queue_account_mapping()
returns trigger language plpgsql as $$
declare
  acct_platform platform_type;
  mapped boolean;
begin
  if new.social_account_id is null then
    return new;
  end if;

  select platform into acct_platform
  from social_accounts
  where id = new.social_account_id and active = true;

  if acct_platform is null or acct_platform <> new.platform then
    raise exception 'Social account platform mismatch or inactive account';
  end if;

  select exists(
    select 1
    from shop_social_accounts ssa
    where ssa.shop_id = new.shop_id
      and ssa.social_account_id = new.social_account_id
      and ssa.platform = new.platform
      and ssa.active = true
  ) into mapped;

  if not mapped then
    raise exception 'Social account is not mapped to this shop/platform';
  end if;

  return new;
end;
$$;

drop trigger if exists trg_queue_account_mapping on publish_queue;
create trigger trg_queue_account_mapping
before insert or update on publish_queue
for each row execute function enforce_queue_account_mapping();

-- Integrity checks for current imported catalog.
do $$
declare
  product_count integer;
  pin_count integer;
  fb_count integer;
  queue_count integer;
begin
  select count(*) into product_count from products;
  select count(*) into pin_count from content_variants where platform='pinterest' and creative_id='pin-v1' and version=1;
  select count(*) into fb_count from content_variants where platform='facebook' and creative_id='fb-v1' and version=1;
  select count(*) into queue_count from publish_queue where status='draft';

  if pin_count <> product_count then
    raise exception 'Pinterest variant count mismatch: products %, pins %', product_count, pin_count;
  end if;
  if fb_count <> product_count then
    raise exception 'Facebook variant count mismatch: products %, facebook %', product_count, fb_count;
  end if;
  if queue_count < product_count * 2 then
    raise exception 'Draft queue incomplete: expected at least %, found %', product_count * 2, queue_count;
  end if;
end $$;
