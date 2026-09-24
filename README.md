# Store Promotion

Centralized promotion system for multiple Etsy stores.

## Project Goal

Build one reusable promotion system for approximately 30 Etsy shops, with a central product database and multi-platform publishing to Pinterest and Facebook first, with room to expand to Instagram and TikTok later.

## Core Architecture

```
30 Etsy Shops
      ↓
Central Product Database (Supabase / PostgreSQL)
      ↓
AI Content Generation
      ↓
Publishing Scheduler
   ├─ Pinterest
   └─ Facebook
      ↓
Publish History + Analytics
```

## Technology Decisions

- **Supabase**: preferred managed backend for the first phase.
- **PostgreSQL**: underlying database engine.
- **GitHub**: stores code, rules, prompts, templates and configuration.
- **Supabase database**: stores dynamic product, account, queue and publishing data.
- **Images**: do not store image binaries directly in PostgreSQL. Store URLs in the database and use Etsy URLs or object storage for long-term assets.

## Main Data Areas

- `shops`
- `products`
- `social_accounts`
- `content_variants`
- `publish_queue`
- `publish_history`
- `analytics`

## Publishing Principle

Pinterest and Facebook share the same product facts and images, but each platform receives independently generated copy and publishing rules.

A product should not be promoted only once. The system should support scheduled reuse of different images and content variants over time.

Example:

- Day 1: Pinterest lifestyle image A
- Day 4: Facebook multi-image post
- Day 12: Pinterest lifestyle image B
- Day 30: Pinterest detail image
- Day 45: Facebook second promotion
- Day 90: eligible products enter evergreen promotion

## Phase 1

1. Import all Etsy shops.
2. Define shop-to-social-account mappings.
3. Import Etsy listings into Supabase.
4. Create Pinterest boards/category rules.
5. Define Facebook page/category rules.
6. Generate platform-specific content.
7. Add deduplication and scheduling.
8. Record publication IDs and timestamps.
9. Add performance tracking later.

See [docs/promotion-system.md](docs/promotion-system.md) for the full plan.
