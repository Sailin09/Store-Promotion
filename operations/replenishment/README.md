# Continuous reviewed replenishment

The Codex thread automation discovers and visually verifies new Etsy listings every six hours. It requires the host and Codex app to remain running. This is an agent-driven discovery loop, not a server-side Etsy crawler. GitHub automatically ingests committed batch files and Supabase independently schedules publication.

Read fresh `scripts/replenishment-plan.sql` output before discovery. Target three usable items per active shop/account, prioritizing zero stock, then smallest stock. This is a minimum buffer, not seven-day coverage. Never fill obsolete/inactive mappings. Historical queue coverage can include obsolete account routes (notably Chtte on P3); the plan starts from current active mappings.

For each deficit find new listing IDs in the registered shop's current public Etsy storefront. Exclude every `known_listing_ids` entry, verify the actual listing seller, in-stock options and Add to cart, and inspect the actual original image visually. Do not infer image contents from alt text. Use only a suitable existing Board for the exact account; the runner independently checks current owned/public membership. If no suitable Board is known, report the route blocked rather than guessing or changing mappings.

Write unique `batch-YYYYMMDD-HHMMSS.json` files here, arrays of at most 20 items, using the schema in `operations/materials-2026-10-23-b15.json`. Preserve honest source timestamps and explain the source/visual evidence. Do not invent claims, silently refresh timestamps, requeue previously known listings, or change publisher gates. Stop when the measured deficits are filled; do not replenish accounts already above the target.

Push batches to main using GitHub connector commits with an expected head lease. The `Replenish verified stock` workflow tests, verifies live Boards/images, ingests one item per transaction (a bad shop does not roll back other shops), retries to prove deduplication and prints persisted stock. Existing listing IDs are filtered before stale evidence checks. New stale items fail closed. Workflow success with zero insertion is not replenishment success. If pending stale/rejected batches remain, remove only the rejected entries into a separate audit JSON outside the batch pattern before retrying newly verified material; never edit their evidence to appear fresh.

Every run must verify actual insertion counts and queue snapshot matches, record unresolved deficits, and report failures. When no action is needed, stay quiet. Do not modify the separate one-time publication verification automation.
