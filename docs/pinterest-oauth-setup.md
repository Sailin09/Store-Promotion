# Pinterest OAuth setup

This adds authorization only. No automatic publishing, board creation, queue activation,
or token-refresh schedule is enabled. Trial Pins remain visible only to their creator.

## Registered redirect URI

https://sailin09.github.io/Store-Promotion/pinterest-connect.html

This exact URL serves both the connection form and OAuth callback. Register it in
Pinterest app 1617125. GitHub Pages must deploy the file before connecting.

## Deployment

Existing database deployment applies migration 011 on a main-branch push.
Run **Deploy Pinterest OAuth** from GitHub Actions after setting the production
(or repository) secret `SUPABASE_ACCESS_TOKEN` to a Supabase deployment token.
It also requires the existing `SUPABASE_DB_URL`. Never put either value in code,
workflow input, issue, PR, browser URL, or chat.

The workflow deploys `pinterest-oauth` to project `czexstqnkogfvqyjvatr`.
The function uses its built-in SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY.
In that project's Edge Functions > Secrets, configure:

| Name | Value |
| --- | --- |
| PINTEREST_APP_SECRET | App 1617125's secret from Pinterest |
| PINTEREST_CONNECT_KEY | A new randomly generated administrator connection passphrase, at least 32 characters |
| PINTEREST_TOKEN_KEY | Base64 encoding of 32 cryptographically random bytes (AES-256 key) |

Create and store these values using an administrator-controlled password manager
or secure local generator. Keep a secure backup of PINTEREST_TOKEN_KEY: changing
it without re-encrypting existing rows makes saved tokens unreadable. This version
supports reauthorization after key replacement; it does not implement key migration.
The connection passphrase is distinct from Pinterest passwords and the app secret.

## First connection

Use P2 (`sailing_981`) first because it administers the Pinterest app.
Visit the redirect URL, select P2, enter only PINTEREST_CONNECT_KEY, then authorize
on Pinterest. Continue in the same browser tab (sessionStorage binds the callback).
Other accounts must satisfy Pinterest's Trial collaborator/account eligibility;
registration in our database alone does not grant Pinterest API access.

The success page shows the verified username, never tokens. Confirm the selected
social_accounts row has account_status=authorized_trial and a credential_reference.
All publish_queue statuses should remain unchanged. Never enable public publishing
solely because authorization succeeded. Standard access is a separate Pinterest review.

## Security and operation

- No Pinterest passwords or Pinterest session cookies are collected.
- State and browser proof are random, hashed at rest, expire after ten minutes, and
  are consumed atomically by a service-role-only database function.
- A database check revalidates the account handle while saving; mismatches do not
  replace saved credentials. A mismatch may still leave a grant at Pinterest;
  revoke unwanted grants in Pinterest connected-app settings.
- Tokens are encrypted with AES-GCM using the social account UUID as authenticated
  data and a unique IV. RLS and explicit grants deny anon/authenticated table access.
- The Edge Function has gateway JWT verification disabled because callbacks have
  no Supabase JWT. Start requires the administrator passphrase; completion requires
  both state and browser proof. CORS alone is not authentication.
- The browser clears the code query before API calls, has no external scripts or
  analytics, and sends no referrer. The initial callback URL still reaches GitHub
  Pages infrastructure, as with any hosted OAuth callback.
- Error responses do not include upstream response bodies, secrets, or codes.
- Expired state rows are deleted on the next authorized start.
- Tokens may expire while publishing is unimplemented. Reauthorize before testing
  if necessary; implement and test refresh handling before any future scheduler.

## Validation

`node --test tests/pinterest-oauth.test.mjs`

Tests cover invalid origins/admin credentials, missing configuration, insufficient
scopes, encryption/account binding, callback proof, replay, mismatched accounts,
and a mocked successful token exchange. They do not replace live migration,
deployment or user-consented Pinterest OAuth testing.
