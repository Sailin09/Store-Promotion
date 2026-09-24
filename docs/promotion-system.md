# Etsy Multi-Store Promotion System

## 1. Scope

This project is designed to support roughly 30 Etsy stores from one central promotion system.

Initial publishing channels:

- Pinterest
- Facebook

Future expansion:

- Instagram
- TikTok
- Other social or advertising channels

The system should reduce repetitive manual work while keeping each shop, product, social account and publishing history separate.

---

## 2. Central Product Database

The recommended first-stage database is **Supabase**, using its managed PostgreSQL database.

### Why Supabase

PostgreSQL itself is open-source and free, but self-hosting requires server setup, backups, security, API development, monitoring and maintenance.

Supabase provides PostgreSQL plus a managed service layer, making it more suitable for the first version of this project.

Recommended rollout:

- **Phase 1:** Supabase Free
- **Phase 2:** Upgrade only when actual usage or production reliability requires it
- **Later:** PostgreSQL data can be migrated to another host if required

The project should avoid unnecessary platform lock-in by keeping the data model PostgreSQL-compatible.

---

## 3. GitHub vs Supabase Responsibilities

### GitHub stores

- application code
- automation scripts
- shop rules
- category rules
- Pinterest prompts
- Facebook prompts
- image-generation rules
- publishing templates
- configuration examples
- technical documentation
- database migration files

### Supabase stores

- Etsy shop records
- Etsy product/listing records
- product URLs
- product image URLs
- social account mappings
- Pinterest boards
- Facebook Pages
- generated content variants
- scheduling queue
- publication status
- Pin IDs
- Facebook Post IDs
- publication timestamps
- deduplication records
- analytics data

GitHub should not be used as the live operational database.

---

## 4. Proposed Core Tables

### shops

Represents an Etsy store.

Suggested fields:

- id
- shop_name
- etsy_shop_url
- active
- category_group
- default_language
- created_at
- updated_at

### products

One record per Etsy listing.

Suggested fields:

- id
- shop_id
- etsy_listing_id
- etsy_url
- title
- description
- category
- price
- currency
- status
- original_image_urls
- primary_image_url
- created_at
- updated_at

### social_accounts

Maps stores to promotion accounts.

Suggested fields:

- id
- platform
- account_name
- account_id
- active
- credential_reference
- created_at

A store should not be hard-coded to one account. The system should allow mappings such as:

- Etsy Shop A → Pinterest Account 1 + Facebook Page 1
- Etsy Shop B → Pinterest Account 1 + Facebook Page 2
- Etsy Shop C → Pinterest Account 2 + Facebook Page 3

### shop_social_accounts

Suggested fields:

- id
- shop_id
- social_account_id
- platform
- active

### content_variants

Stores platform-specific promotion content.

Suggested fields:

- id
- product_id
- platform
- image_url
- title
- body
- destination_url
- board_or_category
- content_type
- version
- status
- created_at

Pinterest and Facebook must use separate content variants even when they use the same product facts.

### publish_queue

Suggested fields:

- id
- product_id
- content_variant_id
- platform
- social_account_id
- scheduled_at
- priority
- queue_status
- retry_count
- created_at

### publish_history

Suggested fields:

- id
- product_id
- content_variant_id
- platform
- social_account_id
- published_at
- external_post_id
- external_url
- publish_status
- error_message

This table is the main deduplication source.

### analytics

Suggested fields:

- id
- publish_history_id
- date
- impressions
- clicks
- saves
- reactions
- comments
- shares
- outbound_clicks
- conversions

---

## 5. Image Storage Strategy

Do not store image binaries directly inside PostgreSQL.

Store only image references such as:

- original_image_url
- etsy_image_url
- generated_image_url
- storage_url

Recommended storage order:

1. Use Etsy-hosted product image URLs where appropriate.
2. Store reusable generated marketing assets in object storage.
3. Supabase Storage is acceptable for the first phase.
4. Cloudflare R2 can be considered later for larger-scale storage.

The database should keep metadata and URLs, not the image binary itself.

---

## 6. Pinterest Strategy

Pinterest should be treated primarily as a long-term discovery and search channel.

Each Etsy listing can generate multiple Pins over time.

Possible content variants:

- primary lifestyle image
- second lifestyle scene
- close-up/detail image
- alternative room setting
- seasonal variation

Each Pin can point to the same Etsy listing while using different:

- image
- title
- description
- keyword focus
- board

### Example evergreen schedule

For one Etsy listing:

- Day 1 → Pinterest image A
- Day 12 → Pinterest image B
- Day 30 → Pinterest detail image
- Day 60+ → further qualified reuse

The exact interval will be configurable per shop/category.

### Board strategy

Do not automatically create one Pinterest board per Etsy store.

Prefer user-interest/product-intent boards such as:

- Curtains
- Floral Curtains
- Bedroom Curtains
- Cottage Home Decor
- Table Linens
- Wooden Hangers

Board structure will be finalized after the 30 Etsy shops are imported and categorized.

---

## 7. Facebook Strategy

Facebook should not simply copy Pinterest content word-for-word.

The same product facts can be reused, but Facebook content should have its own format.

Possible Facebook formats:

- single-image product post
- multi-image product post
- product story/context post
- seasonal promotion
- second evergreen promotion at a later date

Example schedule:

- Day 4 → Facebook first promotion
- Day 45 → Facebook second variation

The system should support separate Facebook Pages for different Etsy stores.

---

## 8. Multi-Platform Content Model

One Etsy product becomes a reusable source record.

Example:

```
Etsy Product A
├─ Pinterest Variant 01
├─ Pinterest Variant 02
├─ Pinterest Variant 03
├─ Facebook Variant 01
└─ Facebook Variant 02
```

This avoids duplicating product facts while allowing platform-native promotional content.

---

## 9. Scheduling and Deduplication

The scheduler must check publication history before publishing.

Core rules:

- never publish the same content variant twice accidentally
- track which image was used
- track which account/page was used
- enforce minimum intervals
- allow different intervals per platform
- pause inactive Etsy listings
- retry failed API calls safely
- prevent simultaneous duplicate jobs

Recommended queue states:

- draft
- ready
- scheduled
- publishing
- published
- failed
- paused

---

## 10. Evergreen Promotion

Products should be eligible for repeated promotion if they remain active.

Example lifecycle:

```
New Etsy Listing
   ↓
Initial Pinterest promotion
   ↓
Initial Facebook promotion
   ↓
Additional Pinterest image variants
   ↓
Additional Facebook variation
   ↓
Evergreen pool
   ↓
Periodic future reuse if still active
```

Evergreen eligibility may later consider:

- listing still active
- stock/status
- seasonality
- prior engagement
- time since last promotion
- platform-specific repetition limits

---

## 11. Future Analytics

The first version does not need advanced analytics to start publishing.

Later, analytics can be used to answer:

- which Etsy shops get the most social traffic
- which product categories perform best
- which Pinterest boards generate clicks
- which image types perform best
- which Facebook content styles generate engagement
- which products deserve more frequent promotion
- which products should be removed from evergreen rotation

Eventually, the scheduler may use analytics to prioritize content automatically.

---

## 12. Initial Implementation Order

### Stage A — Foundation

1. Create Supabase project.
2. Create database schema.
3. Add Etsy shops.
4. Add social account mapping.
5. Import Etsy listings.

### Stage B — Pinterest

1. Define boards.
2. Define Pinterest content prompts.
3. Create content variants.
4. Implement queue.
5. Connect Pinterest publishing.
6. Record Pin IDs and publication history.

### Stage C — Facebook

1. Add Facebook Pages/accounts.
2. Define Facebook content prompts.
3. Add Facebook content variants.
4. Connect Facebook publishing.
5. Record Facebook Post IDs and history.

### Stage D — Optimization

1. Add evergreen scheduling.
2. Add analytics.
3. Add performance-based prioritization.
4. Add Instagram.
5. Add TikTok or other channels if useful.

---

## 13. Current Decision Summary

The current agreed direction is:

- One central promotion system for all Etsy shops.
- Supabase-managed PostgreSQL as the first operational database.
- GitHub for code, prompts, rules, templates and documentation.
- Product images stored externally; PostgreSQL stores URLs and metadata.
- Pinterest and Facebook share product facts but use different content.
- Every product can have multiple promotion variants.
- Publishing is scheduled rather than immediate.
- Publication history prevents duplicate posting.
- Active products can later enter an evergreen promotion cycle.
- Architecture should remain open to Instagram and TikTok.

---

## 14. Next Data Needed

The next practical input is the list of Etsy shop homepage URLs.

After receiving the shop list, the project can add:

- shop master data
- category grouping
- Pinterest board structure
- Facebook Page mapping
- per-category publishing frequency
- per-shop account mapping
- import strategy for Etsy listings
