-- Store Promotion database schema
-- PostgreSQL / Supabase
-- 001_initial_schema.sql

create extension if not exists pgcrypto;

create type shop_status as enum ('active','paused','review','blocked');
create type platform_type as enum ('pinterest','facebook','instagram','tiktok');
create type content_status as enum ('draft','ready','archived');
create type queue_status as enum ('draft','ready','scheduled','publishing','published','failed','paused');

create table if not exists shops (
  id uuid primary key default gen_random_uuid(),
  shop_code text not null unique check (shop_code ~ '^SHOP-[0-9]{3}$'),
  shop_name text not null unique,
  etsy_shop_url text not null unique,
  batch smallint,
  primary_group text,
  primary_category text,
  secondary_notes text,
  classification_confidence text,
  status shop_status not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references shops(id) on delete restrict,
  etsy_listing_id text not null,
  etsy_url text not null,
  title text,
  description text,
  category text,
  price numeric(12,2),
  currency text,
  listing_status text,
  primary_image_url text,
  original_image_urls jsonb not null default '[]'::jsonb,
  source_payload jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(shop_id, etsy_listing_id)
);

create table if not exists social_accounts (
  id uuid primary key default gen_random_uuid(),
  platform platform_type not null,
  account_name text not null,
  external_account_id text,
  credential_reference text,
  active boolean not null default true,
  created_at timestamptz not null default now(),
  unique(platform, account_name)
);

create table if not exists shop_social_accounts (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references shops(id) on delete cascade,
  social_account_id uuid not null references social_accounts(id) on delete cascade,
  platform platform_type not null,
  active boolean not null default true,
  created_at timestamptz not null default now(),
  unique(shop_id, social_account_id, platform)
);

create table if not exists content_variants (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references shops(id) on delete restrict,
  product_id uuid not null references products(id) on delete cascade,
  platform platform_type not null,
  creative_id text not null,
  image_url text,
  title text,
  body text,
  destination_url text not null,
  board_or_category text,
  content_type text,
  version integer not null default 1,
  status content_status not null default 'draft',
  created_at timestamptz not null default now(),
  unique(shop_id, product_id, platform, creative_id, version)
);

create table if not exists publish_queue (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references shops(id) on delete restrict,
  product_id uuid not null references products(id) on delete cascade,
  content_variant_id uuid not null references content_variants(id) on delete cascade,
  platform platform_type not null,
  social_account_id uuid not null references social_accounts(id) on delete restrict,
  scheduled_at timestamptz,
  priority integer not null default 100,
  status queue_status not null default 'draft',
  retry_count integer not null default 0,
  last_error text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(shop_id, product_id, platform, content_variant_id)
);

create table if not exists publish_history (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references shops(id) on delete restrict,
  product_id uuid not null references products(id) on delete restrict,
  content_variant_id uuid not null references content_variants(id) on delete restrict,
  platform platform_type not null,
  social_account_id uuid not null references social_accounts(id) on delete restrict,
  published_at timestamptz not null default now(),
  external_post_id text,
  external_url text,
  publish_status text not null,
  error_message text,
  created_at timestamptz not null default now()
);

create unique index if not exists publish_history_dedupe
on publish_history(shop_id, product_id, platform, content_variant_id, coalesce(external_post_id,''));

create table if not exists analytics (
  id uuid primary key default gen_random_uuid(),
  publish_history_id uuid not null references publish_history(id) on delete cascade,
  metric_date date not null,
  impressions bigint not null default 0,
  clicks bigint not null default 0,
  saves bigint not null default 0,
  reactions bigint not null default 0,
  comments bigint not null default 0,
  shares bigint not null default 0,
  outbound_clicks bigint not null default 0,
  conversions bigint not null default 0,
  created_at timestamptz not null default now(),
  unique(publish_history_id, metric_date)
);

create index if not exists idx_products_shop_id on products(shop_id);
create index if not exists idx_queue_shop_status_time on publish_queue(shop_id, status, scheduled_at);
create index if not exists idx_history_shop_platform_time on publish_history(shop_id, platform, published_at desc);

-- Fail-closed queue safety: queued item and content/product must belong to the same shop.
create or replace function enforce_publish_queue_shop_integrity()
returns trigger language plpgsql as $$
declare
  p_shop uuid;
  c_shop uuid;
begin
  select shop_id into p_shop from products where id = new.product_id;
  select shop_id into c_shop from content_variants where id = new.content_variant_id;
  if p_shop is null or c_shop is null or p_shop <> new.shop_id or c_shop <> new.shop_id then
    raise exception 'shop isolation violation in publish_queue';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_publish_queue_shop_integrity on publish_queue;
create trigger trg_publish_queue_shop_integrity
before insert or update on publish_queue
for each row execute function enforce_publish_queue_shop_integrity();

-- Prevent publication for non-active shops.
create or replace function block_nonactive_shop_publish()
returns trigger language plpgsql as $$
declare
  s shop_status;
begin
  select status into s from shops where id = new.shop_id;
  if s is distinct from 'active'::shop_status then
    raise exception 'shop % is not active', new.shop_id;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_publish_history_active_shop on publish_history;
create trigger trg_publish_history_active_shop
before insert on publish_history
for each row execute function block_nonactive_shop_publish();

alter table shops enable row level security;
alter table products enable row level security;
alter table social_accounts enable row level security;
alter table shop_social_accounts enable row level security;
alter table content_variants enable row level security;
alter table publish_queue enable row level security;
alter table publish_history enable row level security;
alter table analytics enable row level security;

comment on table shops is 'Master registry of isolated Etsy shops.';
comment on table publish_queue is 'Per-shop outbound social publishing queue. Cross-shop references are blocked by trigger.';
