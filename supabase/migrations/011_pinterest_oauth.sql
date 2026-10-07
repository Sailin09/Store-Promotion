-- Only service_role can access OAuth state and encrypted credentials.
create table public.pinterest_oauth_states (
  state_hash text primary key,
  browser_hash text not null,
  social_account_id uuid not null references public.social_accounts(id) on delete cascade,
  expected_handle text not null,
  expires_at timestamptz not null default now() + interval '10 minutes'
);
create table public.pinterest_oauth_credentials (
  social_account_id uuid primary key references public.social_accounts(id) on delete cascade,
  pinterest_username text not null unique,
  encrypted_tokens text not null,
  scopes text not null,
  access_expires_at timestamptz not null,
  connected_at timestamptz not null default now()
);
alter table public.pinterest_oauth_states enable row level security;
alter table public.pinterest_oauth_credentials enable row level security;
revoke all on public.pinterest_oauth_states, public.pinterest_oauth_credentials from public, anon, authenticated;
grant select, insert, update, delete on public.pinterest_oauth_states, public.pinterest_oauth_credentials to service_role;

create function public.consume_pinterest_oauth_state(p_state_hash text, p_browser_hash text)
returns setof public.pinterest_oauth_states
language sql security invoker set search_path = '' as $$
  delete from public.pinterest_oauth_states
  where state_hash = p_state_hash and browser_hash = p_browser_hash and expires_at > now()
  returning *;
$$;
revoke all on function public.consume_pinterest_oauth_state(text,text) from public, anon, authenticated;
grant execute on function public.consume_pinterest_oauth_state(text,text) to service_role;

create function public.save_pinterest_oauth_connection(
  p_account_id uuid, p_username text, p_ciphertext text, p_scopes text, p_expires_at timestamptz
) returns void language plpgsql security invoker set search_path = '' as $$
declare a public.social_accounts;
begin
  select * into a from public.social_accounts where id=p_account_id for update;
  if a.id is null or a.platform <> 'pinterest' or not a.active
     or lower(a.handle) is distinct from lower(p_username) then
    raise exception 'Pinterest account does not match registry';
  end if;
  insert into public.pinterest_oauth_credentials
    (social_account_id,pinterest_username,encrypted_tokens,scopes,access_expires_at)
  values (p_account_id,lower(p_username),p_ciphertext,p_scopes,p_expires_at)
  on conflict (social_account_id) do update set
    pinterest_username=excluded.pinterest_username, encrypted_tokens=excluded.encrypted_tokens,
    scopes=excluded.scopes, access_expires_at=excluded.access_expires_at, connected_at=now();
  update public.social_accounts set
    credential_reference='pinterest_oauth_credentials:' || p_account_id::text,
    account_status='authorized_trial'
  where id=p_account_id;
  -- Intentionally leave product routing, publishing rules and draft queues unchanged.
end;
$$;
revoke all on function public.save_pinterest_oauth_connection(uuid,text,text,text,timestamptz) from public, anon, authenticated;
grant execute on function public.save_pinterest_oauth_connection(uuid,text,text,text,timestamptz) to service_role;
