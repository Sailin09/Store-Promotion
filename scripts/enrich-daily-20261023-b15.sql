-- The obsolete copied jewelry batch is intentionally disabled.
-- Run scripts/replenish-verified.mjs for live Board/image checks and atomic ingestion.
\set ON_ERROR_STOP on
do $$ begin raise exception 'Use scripts/replenish-verified.mjs'; end $$;
