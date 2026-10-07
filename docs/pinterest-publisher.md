# Pinterest publisher

The hourly GitHub workflow invokes one bounded Supabase Edge Function job. The database defaults to disabled/Trial. Deployment and a green scheduled run do not mean public publishing is active.

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

Existing GitHub production secrets: `SUPABASE_DB_URL` and `SUPABASE_ACCESS_TOKEN`. Supabase retains `PINTEREST_APP_SECRET` and `PINTEREST_TOKEN_KEY`; they are never copied to GitHub. The scheduler uses the management token to retrieve the existing service-role invocation key transiently, masks it and only invokes the fixed project function. Its handler accepts only an exact service-role bearer token. No request can provide a custom endpoint, product or token. Restrict repository/workflow editing to trusted administrators because the existing deployment secrets are privileged.

`Run Pinterest publisher` is hourly, one item per run, and supports a manual run. GitHub scheduling can be delayed and is not an exact-time guarantee. Disabled/Trial runs return `blocked` without calling Pinterest. Failed runs are failures, not successful publications.

## Reconciliation and recovery

Inspect `pinterest_publish_attempts` and platform records before resetting anything. A successful response whose DB finalization failed exposes only the attempt ID and Pin ID in the workflow output. Verify that Pin's account, board and destination match the stored snapshot, then call `finish_pinterest_publish(attempt_id, 'published', pin_id)` to record it idempotently. Never infer success from a timeout.

If no Pin ID is known, locate the actual result in Pinterest or leave the item paused; there is no automatic uncertain-job replay. The initial version deliberately requires administrator reconciliation and does not delete attempts to retry. To stop new dispatches set `enabled=false`; this cannot cancel an HTTP request already dispatched.

Validation: `node --test tests/*.test.mjs`; SQL tests run in CI using `tests/pinterest-publisher.sql`. No test publishes live Pins. Standard-only live publishing remains untested until account/board/review prerequisites are complete.
