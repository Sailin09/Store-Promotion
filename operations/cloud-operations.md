# Cloud operations without new API credentials

## Update: 2026-10-23 08:36 UTC

ChatGPT Work cloud has successfully inspected real Etsy listing pages and images for Chtte, TunaMunStudio and Parkermo and committed audit evidence using the GitHub connector. The separate ChatGPT automation `6adb18502ca08191b0b05f436915aee4` was read back as enabled, with UTC 05:15/11:15/17:15/23:15 execution times. The audit API did not independently expose a runtime field or a completed scheduled run. An immediate run has been requested; acceptance alone is not proof of completion. Fresh stock remains 116 with zero deficits, so no new batch was inserted. The first real deficit-to-ingestion run remains unverified. See `replenishment/cloud-capability-20261023.json` and `replenishment/cloud-automation-audit-20261023.json`. No user API keys are required by this task. Tonight's 13:35 UTC verification remains unchanged.

The limitation below describes the earlier GitHub-hosted runner route; it does not negate the later ChatGPT cloud browser capability test.

The user requested a simpler setup on 2026-10-23. No new API service is required for the deployed publication, snapshot and stock reporting paths.

- Pinterest publishing continues in Supabase on its existing five-minute scheduler, with its existing time windows, review checks, account/shop intervals and duplicate protection.
- Supabase captures the one-time publication report on **2026-10-23 at 13:35 UTC / 21:35 Beijing**. The snapshot includes all five accounts, real publication-history Pin IDs and links, unfinished attempts and recent scheduler outcomes. The cron function is date-guarded and the report key is unique.
- GitHub Actions `Cloud promotion operations` retrieves the snapshot, checks failures, restores a missing/disabled scheduler if needed, and performs at most one guarded publisher batch if an account has no new Pins or unresolved attempts. It never resets uncertain attempts or removes deduplication history. Unknown failures remain explicit in the report; this is bounded recovery, not an unrestricted AI repair agent.
- GitHub generates the evening Issue titled `Pinterest 2026-10-23 21:35 发布复核`. Actions can be delayed; the database snapshot preserves the requested capture time independently. The Issue includes any later recovery results separately.
- Cloud stock checks run at 05:15, 11:15, 17:15 and 23:15 UTC. The Issue `Pinterest 云端库存与运行状态` is updated; a comment notifies a changed nonzero stock deficit. Target remains three usable reviewed items per active shop/account route. GitHub notification delivery follows the user's GitHub notification settings.
- Evidence is also retained as workflow artifacts for 30 days. No computer or desktop Codex process is required for these jobs.

## Explicit replenishment limitation

Cloud discovery of new Etsy products is **not enabled**. The actual GitHub-hosted runner storefront probe returned HTTP 403 with a challenge and no listing links. Neither `ETSY_API_KEY` nor `OPENAI_API_KEY` was configured. The user preferred a simpler setup rather than adding services. Existing verified material ingestion remains available through `Replenish verified stock`, but an inventory check is not a replacement for discovering and visually reviewing new products.

The current reserve is 116 reviewed usable items across 30 shops / 32 account routes. When depleted, stock checks will report the deficit; fresh material still needs source and image verification before ingestion. Do not mark `visual_verified` true merely because an image URL returns HTTP 200. The previously local discovery heartbeat should remain paused once cloud reporting is verified, so it does not imply that replenishment will work while the computer is off.

Capability probe: https://github.com/Sailin09/Store-Promotion/actions/runs/39915593470


Cloud verification succeeded: https://github.com/Sailin09/Store-Promotion/actions/runs/39916367871 . Report: https://github.com/Sailin09/Store-Promotion/issues/2 . All 52 Node tests and six SQL suites passed. Both local heartbeat automations were paused after successful cloud verification.
