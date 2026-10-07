-- The OAuth backend reads the account registry and updates only connection metadata.
-- Grant access to the server role only; browser roles retain their existing restrictions.
grant usage on schema public to service_role;
grant select on public.social_accounts to service_role;
grant update (credential_reference, account_status) on public.social_accounts to service_role;
