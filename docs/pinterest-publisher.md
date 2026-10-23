# Pinterest publisher

The primary scheduler is Supabase pg_cron, checking every five minutes and invoking one bounded Edge Function job per tick during the existing Beijing windows. GitHub's hourly workflow remains a fallback and manual runner (up to ten sequential jobs). Deployment and a green scheduled run do not mean a Pin was published.

## Reliable scheduler (2026-10-23)

GitHub scheduled checks missed every publishing window after October 20. Deployment now installs a named, idempotent pg_cron job using pg_net and an encrypted project-local Vault credential. No key is embedded in cron commands or source. The scheduler function is administrator-only; it cannot accept an endpoint or arbitrary payload. The pending HTTP queue is inaccessible to public, anon, authenticated and service_role roles.

All existing worker gates, exact reviews, shop/account spacing and uncertain-job reservations remain unchanged. `pinterest_scheduler_requests` records safe HTTP outcomes separately from cron SQL success. Missing responses are recorded, not treated as successful Pins. `scripts/inspect-pinterest-scheduler.sql` reports cron runs, HTTP outcomes and actual account publication times, and warns when reviewed stock remains with no publication for 26 hours. Disable `pinterest_publish_settings.enabled` to stop dispatches; an already dispatched call may finish.

The five-minute check continues outside windows only to collect prior responses; it does not send new HTTP requests there. GitHub remains a fallback, so it can still report `outside_publish_window` normally. Judge delivery by new `publish_history` rows and external Pin IDs.

## Reviewed replenishment

`scripts/replenish-verified.mjs` uses `operations/materials-2026-10-23-b15.json`, checks the current owned/public Board and image reachability, then invokes the administrative SQL function `replenish_verified_products`. New listings require genuine source and visual verification within 24 hours. Do not advance timestamps without rechecking the source. The database validates each item, accepts multi-item batches atomically and skips existing products without refreshing their evidence or touching history. A failed item rolls back the entire batch. Existing publication reviews still use their separate 30-day validity period.

The repaired b15 workflow runs after a successful main deployment or manually, and verifies a second invocation adds zero duplicate products. The former SQL file fails closed to prevent accidental reuse of the copied, stale jewelry batch. Historical batch scripts are retained as audit artifacts; use the new ingestion path for new batches.

## What runs

- `claim_pinterest_publish` atomically reserves a reviewed, due queue item. Claims serialize and reserve both the shop and account while a job is pending.
- Every review contains the exact queue/account/product/creative snapshot plus a numeric board ID, original listing URL and verification dates. Changes invalidate the review. Current listing/creative checks expire after 30 days.
- Rules use a rolling 24-hour cap, minimum shop/platform gap and product evergreen interval from `promotion_rules`. Any existing history for a creative prevents replay.
- The worker decrypts credentials only inside Supabase, refreshes expiring tokens with compare-and-swap storage, and checks the live Pinterest username and board owner/public visibility. It verifies the allowlisted Etsy image URL is reachable.
- A durable dispatch marker is written before a single Pin POST. Successful Pin IDs and history are committed together. Database-finalization retries never repeat Pin creation.
- Errors pause the item. A timeout, malformed response, crash or any error after dispatch reserves the shop/account for reconciliation. This intentionally prefers missed publication to duplicates.

## Activation prerequisites

Keep settings disabled until Standard approval is independently verified in Pinterest. Record evidence and its date in `pinterest_publish_settings`. OAuth authorization alone is not Standard approval.

For each item, verify product availability and image/description ownership, correct category/account routing and a real public board belonging to that Pinterest account. Save `pinterest_publish_snapshot(queue_id)` in `pinterest_publish_reviews`, with the verified board ID, current listing-check time and exact original listing URL. Set the creative to `ready`, and queue to `ready` or `scheduled` with a due time. No worker promotes drafts or guesses boards.

Only then enable settings. Existing Trial-only accounts may remain `authorized_trial` because this describes the connection time; the application-level Standard gate is separate. Validate that the connected account is eligible for the approved app. No Facebook or paid advertising is implemented by this worker.

## Deployment and credentials

`Deploy Supabase Migrations` now first runs Node tests and all migrations plus queue invariant checks on disposable PostgreSQL 17. Only a passing test job can apply the migration and deploy the Edge Function.

Existing GitHub production secrets: `SUPABASE_DB_URL` and `SUPABASE_ACCESS_TOKEN`. Supabase retains `PINTEREST_APP_SECRET` and `PINTEREST_TOKEN_KEY`; they are never copied to GitHub. The scheduler uses the management token to retrieve the existing service-role invocation key transiently, masks it and only invokes the fixed project function. Its handler accepts a project service-role credential via x-publisher-key or Bearer, validating alternate service credentials through the role-restricted Data API RPC. No request can provide a custom endpoint, product or token. Restrict repository/workflow editing to trusted administrators because the existing deployment secrets are privileged.

`Run Pinterest publisher` is configured hourly, processes up to ten eligible items sequentially per run, and supports a manual run. GitHub scheduling can be delayed and is not an exact-time guarantee. Disabled/Trial runs return `blocked` without calling Pinterest. Failed runs are failures, not successful publications.

## Reconciliation and recovery

Inspect `pinterest_publish_attempts` and platform records before resetting anything. A successful response whose DB finalization failed exposes only the attempt ID and Pin ID in the workflow output. Verify that Pin's account, board and destination match the stored snapshot, then call `finish_pinterest_publish(attempt_id, 'published', pin_id)` to record it idempotently. Never infer success from a timeout.

If no Pin ID is known, locate the actual result in Pinterest or leave the item paused; there is no automatic uncertain-job replay. The initial version deliberately requires administrator reconciliation and does not delete attempts to retry. To stop new dispatches set `enabled=false`; this cannot cancel an HTTP request already dispatched.

Validation: `node --test tests/*.test.mjs`; SQL tests run in CI using `tests/pinterest-publisher.sql`. No test publishes live Pins. Standard-only live publishing remains untested until account/board/review prerequisites are complete.

## Isolated Trial review demo

`pinterest-trial-demo` is a separate manual-only endpoint. The production endpoint cannot select this mode from request data. Both endpoints retain service-role authentication and credential/account/board/image checks. The manual `Run one Pinterest Trial demo` workflow has no schedule.

Migration 015 adds a private singleton `pinterest_trial_demo` record. An administrator must first review an exact current draft snapshot and public board for the app owner's `sailing_981` account, verify the listing and image, then insert that one record. No demo is seeded by deployment. Approval expires after 24 hours; claim and dispatch recheck the snapshot and account/shop mapping. The app must remain disabled/Trial. No production queue or history is changed.

Each demo record is attempted only once, including failures. Never reset it after an uncertain result without reconciling Pinterest. A real success returns `trial_created` and stores its Pin ID separately; this does not count as public promotion. No live API creation has been verified merely by passing the tests.

The runner stops immediately on idle, blocked, or any failed/ambiguous outcome. It never retries a failed invocation. Each job rechecks the existing shop/platform daily cap and gap; batching does not increase those limits. The cap of ten jobs bounds execution even while new work arrives.

## US-market scheduling (enabled 2026-10-15)

Queue claims are allowed only in Asia/Shanghai 08:00–11:00 and 21:00–23:00 (end exclusive).
These are fixed Beijing test windows, not automatic US daylight-saving adjustments.
They correspond to US evening and morning during daylight saving; evaluate outbound-click data before changing windows.
All shops sharing one Pinterest account have an additional minimum two-hour gap, measured from actual publish history.
The existing per-shop rolling 24-hour cap/minimum gap, evergreen interval, exact approvals and uncertain reservations remain enforced.
Outside the windows the publisher returns idle/outside_publish_window without creating an attempt or editing drafts.
No backlog burst is allowed: delayed hourly checks still honor the account gap; items wait for a later eligible window.
An already claimed in-flight attempt may finish just after a window closes; it is never abandoned or replayed.
The existing hourly GitHub schedule remains active, so these are eligibility windows, not exact-time guarantees.
With two-hour account spacing these windows permit at most three claims per account per day, and scheduling delays can reduce this.
Multiple shops therefore rotate across available slots; a per-shop daily maximum is not a promise that every shop publishes daily.
Seven-day reserve calculations must simulate account spacing and windows as well as shop limits and review expiry.

## Continuous stock replenishment (2026-10-23)

The Codex thread automation runs every six hours, discovers new listings for current stock deficits and verifies their live seller, availability and original image. Target: three usable items per active shop/account. The host and Codex app must remain running for discovery. Reviewed batch commits trigger the Replenish verified stock workflow; GitHub does not discover listings by itself. The runner checks current Board ownership and image reachability, enforces the stock target under the ingestion lock, isolates item failures and verifies idempotence. Supabase publication remains independent. See operations/replenishment/README.md and verification-20261023.json for operating instructions, actual insertion evidence and remaining deficits.

