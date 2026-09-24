# Shop Classification — Round 1

Date: 2026-09-24

Purpose: first-pass grouping of the initial 30 Etsy shops for promotion architecture. This is a provisional marketing classification, not a final SKU-level taxonomy.

## Classification Principles

- Every shop keeps its permanent `SHOP-XXX` ID.
- Promotion data, credentials, queues, publish history, failures and pauses remain isolated by `shop_id`.
- Shops may share a category taxonomy or Pinterest Board strategy, but they must not automatically share credentials, posting history or content variants.
- When several shops sell similar products, the system should generate shop-specific content and maintain independent schedules.
- Mixed-category shops should be split into content lanes at product level rather than forced into one single marketing identity.
- Unknown or weakly evidenced secondary categories must be refined during the SKU/listing import phase.

## Promotion Groups

### G1 — Curtains & Window Textiles
Primary discovery themes: curtains, cafe curtains, valances, tie-up shades, blackout curtains, sheer curtains, French country, farmhouse, cottagecore, bedroom curtains, kitchen curtains.

### G2 — Broad Home Textiles
Primary discovery themes: curtains plus table linens, pillow covers, chair pads, sofa covers, bedding, aprons and related soft furnishings.

### G3 — Hangers, Closet & Home Organization
Primary discovery themes: wooden/metal hangers, closet organizers, racks, hooks, shelves, bathroom storage and fabric organizers.

### G4 — Fabrics & Sewing Supplies
Primary discovery themes: embroidered fabric, silk, linen, cotton, jacquard, couture fabric, sewing material and DIY textile supplies.

### G5 — Jewelry & Wearable Accessories
Primary discovery themes: shell jewelry, earrings, necklaces and fashion accessories.

### G6 — Decorative Home Objects & Hardware
Primary discovery themes: coastal decor, shell decor, cabinet knobs, pulls, wood storage accessories and small decor objects.

### G7 — Soft Accessories, Bags & Aprons
Primary discovery themes: decorative pillows, makeup bags, textile bags, aprons and giftable soft accessories.

## Shop-Level First Pass

| Shop ID | Shop | Primary Group | Primary Category | Secondary Category / Notes | Confidence |
|---|---|---|---|---|---|
| SHOP-001 | Parkermo | G1/G2 | Curtains & cafe curtains | Chair pads / soft home textiles also present | High |
| SHOP-002 | WOGOL | G1 | Curtains & cafe curtains | Noren / room divider curtains; linen/cotton window textiles | High |
| SHOP-003 | DanyHomeDesign | G1 | Curtains | Sheer / light-filtering window treatments | Medium |
| SHOP-004 | ShirieHomeShow | G1 | Curtains | Blackout, linen blend, embroidered, sheer styles | High |
| SHOP-005 | SobiaStudio | G1 | Curtains | Romantic / shabby chic / lace / tie-up styles | High |
| SHOP-006 | AmyHomeCrafts | G1/G2 | Curtains | Tie-up / balloon curtains; broader home-textile enrichment pending | Medium |
| SHOP-007 | CustomCurtainsStudio | G1/G2 | Curtains & valances | Crochet tablecloths / table linens also present | High |
| SHOP-008 | LambertHouse | G3 | Hangers & closet organization | Bathroom shelves, hooks, racks, kitchen storage | High |
| SHOP-009 | KoltCraftStudio | G3 | Wooden hangers | Suit, shirt, pants and camphor-wood hangers | High |
| SHOP-010 | WoodHomeLiang | G3/G6 | Wooden hangers | Rack hooks, wood pulls, rattan trays, price-tag stands | High |
| SHOP-011 | NiceCraftStudioHK | G1/G2 | Curtains | Table runners and tablecloths are important secondary categories | High |
| SHOP-012 | GavinHome | G1/G2 | French-style curtains | Tablecloths, pillowcases, chair pads, bed canopy, apron | High |
| SHOP-013 | ChicDecorHK | G1/G5 | Curtains / mixed lifestyle | Also shell/statement jewelry; must be split by product lane | High |
| SHOP-014 | FrenchStyleDecor | G1/G2 | French-style curtains | Tablecloths, bed curtains, bedding, pillowcases, aprons, chair pads | High |
| SHOP-015 | Adamideal | G6 | Wooden home/storage objects | Cable organizer boxes and DIY wood products; mixed wood-goods shop | Medium |
| SHOP-016 | beou | G2/G7 | Home textiles & personalized pillows | Chair cushions, sofa covers, curtains, pillow gifts | High |
| SHOP-017 | MiawoodStudio | G3 | Wooden hangers | Wood price tags, menu stands, place-card holders | High |
| SHOP-018 | HeyDream | G1/G2 | Lace & romantic curtains | Bed canopy curtains, pillowcases, some aprons | High |
| SHOP-019 | KorusStore | G1 | Curtains | Printed / botanical curtain styles | Medium |
| SHOP-020 | CellaHo | G4 | Fabric & sewing supplies | Cotton embroidered fabrics / home-decor sewing material | High |
| SHOP-021 | TunaMunStudio | G1 | Curtains | Custom curtains, tier/cafe curtains, farmhouse/cottagecore | High |
| SHOP-022 | LoomGoStudio | G4 | Specialty fabrics | Silk, organza, embroidered, jacquard, couture/bridal textiles | High |
| SHOP-023 | HibiChStudio | G3/G7 | Fabric organizers | Wall/door hanging organizers and textile storage | High |
| SHOP-024 | PearlsTreasuresArt | G5 | Shell jewelry | Necklaces, earrings and coastal wearable accessories | High |
| SHOP-025 | QuGifts | G6 | Coastal / shell home decor | Shell mirrors, candle holders, baskets, wall hangings, wood-bead curtains | High |
| SHOP-026 | NngGoods | G6 | Cabinet hardware | Natural stone / crystal knobs and drawer pulls | High |
| SHOP-027 | MiraKiuStudio | G7 | Aprons | French-country / vintage cotton apron dresses | High |
| SHOP-028 | StellaGoodsGifts | G7/G2 | Decorative pillow covers | Velvet/jacquard/floral cushion covers | High |
| SHOP-029 | NinaJiaStudio | G7 | Textile bags & accessories | Jacquard cosmetic/travel bags; oriental fabric bags | High |
| SHOP-030 | Chtte | G2 | Chair pads / seat cushions | Linen-cotton dining chair cushions | High |

## First Pinterest Architecture

Do not create one Board per Etsy shop. Use consumer-interest Boards, while keeping shop/account ownership and posting history isolated in the database.

Suggested first Board taxonomy:

### Curtains
- Cafe Curtains
- Kitchen Curtains
- Custom Curtains
- Sheer Curtains
- Blackout Curtains
- Linen Curtains
- Embroidered Curtains
- Floral Curtains
- French Country Curtains
- Cottagecore Curtains
- Farmhouse Curtains
- Tie-Up & Balloon Shades
- Bedroom Curtains
- Bed Canopies

### Home Textiles
- Table Linens
- Decorative Pillow Covers
- Chair Cushions & Seat Pads
- Sofa Covers
- Romantic Bedding
- Vintage Aprons

### Storage & Organization
- Wooden Hangers
- Closet Organization
- Bathroom Storage
- Wall & Door Organizers
- Wooden Home Organization

### Fabrics
- Embroidered Fabric
- Silk & Organza Fabric
- Linen & Cotton Fabric
- Jacquard Fabric
- Sewing & Couture Fabric

### Decor / Hardware
- Coastal Home Decor
- Shell Decor
- Cabinet Knobs & Pulls
- Natural Stone Hardware
- Boho Home Decor

### Jewelry / Accessories
- Seashell Jewelry
- Coastal Jewelry
- Textile Bags
- Vintage Makeup Bags

## Facebook Content Clusters

Facebook should use broader audience/content clusters rather than Pinterest-style keyword fragmentation:

1. Curtains & Window Styling
2. Romantic / French / Cottage Home
3. Home Textiles & Comfort
4. Closet & Home Organization
5. Fabrics & Makers
6. Coastal Decor & Jewelry
7. Giftable Accessories

Each Facebook Page mapping will be attached later to specific shops. No Page should be auto-linked merely because two shops share a category.

## Isolation and Risk-Control Rules for Similar Shops

For the many curtain stores:

- Keep shop credentials and social-account mappings independent.
- Generate content variants from the exact source listing assigned to that shop.
- Never allow a queued post to resolve to a different shop's Etsy URL.
- Use a unique `shop_id + listing_id + platform + creative_id` deduplication key.
- Maintain independent frequency caps per shop.
- A paused/review/blocked shop must stop only its own downstream jobs.
- Similar product categories may share taxonomy rules, but not publication history.
- Cross-shop use of the same source product image should require explicit verification of ownership/source before publishing.
- The goal of isolation is operational safety, brand accuracy and policy compliance, not evasion of Etsy enforcement.

## Round 2

Round 2 should happen after product import and should classify at listing level:

- exact Etsy section/category
- product type
- style
- material
- room/use case
- seasonal status
- target Pinterest Boards
- Facebook content cluster
- source image set
- duplicate/near-duplicate product detection across shops
- evergreen eligibility
- promotion priority

The first-round shop grouping above is sufficient to design the Supabase schema and begin account/Board mapping.
