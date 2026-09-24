# Supabase CI/CD

The repository is configured so that changes under `supabase/migrations/**` on `main` automatically deploy to the production Supabase database.

## Workflow

File:

`.github/workflows/deploy-supabase.yml`

Deployment steps:

1. Checkout repository.
2. Install the current Supabase CLI.
3. Validate the database connection secret.
4. Run `supabase db push --dry-run --include-all`.
5. Run `supabase db push --include-all`.

Supabase migration history prevents already-applied migrations from being re-applied.

## Required GitHub Secret

One encrypted repository/environment secret is required:

`SUPABASE_DB_URL`

Use the Supabase Session Pooler connection string where possible.

Example shape only:

`postgresql://postgres.<PROJECT_REF>:<PASSWORD>@<POOLER_HOST>:5432/postgres`

Never commit the real connection string, database password, service-role key, personal access token, or other credentials to this repository.

## Safety

- Production deploys are serialized with GitHub Actions concurrency.
- The workflow does not reset the remote database.
- It does not run `db reset`.
- It only applies migrations not yet recorded in Supabase migration history.
- The first deployment includes the existing initial schema and 30-shop registry migrations.
- Future schema changes should always be added as a new migration instead of editing an already-deployed migration.
