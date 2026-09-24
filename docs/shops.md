# Etsy Shop Registry

Fixed shop IDs for the Store Promotion project.

## Isolation Rules

- Shop IDs are permanent and must not be renumbered.
- Every product, social account mapping, content variant, queue item, publication record and analytics record must reference a single `shop_id`.
- If shop ownership or mapping is uncertain, do not publish.
- A failure, pause, review state or credential issue for one shop must not automatically affect other shops.
- Do not infer that two shops should share social accounts, credentials, schedules or promotion rules because their products or names are similar.
- Etsy-facing automation should be minimized; the first-stage system should primarily consume public listing data and publish outward to social platforms.

## Registered Shops

| Shop ID | Etsy Shop | Shop URL | Batch | Status |
|---|---|---|---|---|
| SHOP-001 | Parkermo | https://www.etsy.com/shop/Parkermo | 1 | registered |
| SHOP-002 | WOGOL | https://www.etsy.com/shop/WOGOL | 1 | registered |
| SHOP-003 | DanyHomeDesign | https://www.etsy.com/shop/DanyHomeDesign | 1 | registered |
| SHOP-004 | ShirieHomeShow | https://www.etsy.com/shop/ShirieHomeShow | 1 | registered |
| SHOP-005 | SobiaStudio | https://www.etsy.com/shop/SobiaStudio | 1 | registered |
| SHOP-006 | AmyHomeCrafts | https://www.etsy.com/shop/AmyHomeCrafts | 1 | registered |
| SHOP-007 | CustomCurtainsStudio | https://www.etsy.com/shop/CustomCurtainsStudio | 2 | registered |
| SHOP-008 | LambertHouse | https://www.etsy.com/shop/LambertHouse | 2 | registered |
| SHOP-009 | KoltCraftStudio | https://www.etsy.com/shop/KoltCraftStudio | 2 | registered |
| SHOP-010 | WoodHomeLiang | https://www.etsy.com/shop/WoodHomeLiang | 2 | registered |
| SHOP-011 | NiceCraftStudioHK | https://www.etsy.com/shop/NiceCraftStudioHK | 2 | registered |
| SHOP-012 | GavinHome | https://www.etsy.com/shop/GavinHome | 2 | registered |
| SHOP-013 | ChicDecorHK | https://www.etsy.com/shop/ChicDecorHK | 2 | registered |
| SHOP-014 | FrenchStyleDecor | https://www.etsy.com/shop/FrenchStyleDecor | 2 | registered |
| SHOP-015 | Adamideal | https://www.etsy.com/shop/Adamideal | 3 | registered |
| SHOP-016 | beou | https://www.etsy.com/shop/beou | 3 | registered |
| SHOP-017 | MiawoodStudio | https://www.etsy.com/shop/MiawoodStudio | 3 | registered |
| SHOP-018 | HeyDream | https://www.etsy.com/shop/HeyDream | 3 | registered |
| SHOP-019 | KorusStore | https://www.etsy.com/shop/KorusStore | 3 | registered |
| SHOP-020 | CellaHo | https://www.etsy.com/shop/CellaHo | 3 | registered |
| SHOP-021 | TunaMunStudio | https://www.etsy.com/shop/TunaMunStudio | 4 | registered |
| SHOP-022 | LoomGoStudio | https://www.etsy.com/shop/LoomGoStudio | 4 | registered |
| SHOP-023 | HibiChStudio | https://www.etsy.com/shop/HibiChStudio | 4 | registered |
| SHOP-024 | PearlsTreasuresArt | https://www.etsy.com/shop/PearlsTreasuresArt | 4 | registered |
| SHOP-025 | QuGifts | https://www.etsy.com/shop/QuGifts | 4 | registered |
| SHOP-026 | NngGoods | https://www.etsy.com/shop/NngGoods | 4 | registered |
| SHOP-027 | MiraKiuStudio | https://www.etsy.com/shop/MiraKiuStudio | 4 | registered |
| SHOP-028 | StellaGoodsGifts | https://www.etsy.com/shop/StellaGoodsGifts | 4 | registered |
| SHOP-029 | NinaJiaStudio | https://www.etsy.com/shop/NinaJiaStudio | 4 | registered |

## Next IDs

The next shop added must use `SHOP-030`.

## Pending Enrichment

After all shops are registered, enrich each row with:

- primary product category
- secondary categories
- estimated active listing count
- preferred Pinterest board groups
- Facebook Page mapping
- Pinterest account mapping
- publishing frequency profile
- shop status: active / paused / review / blocked
- notes on product overlap and brand-specific content rules
