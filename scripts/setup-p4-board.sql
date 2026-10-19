begin;
create table if not exists public.pinterest_board_setup_operations (
 operation text primary key check (operation='p4-jewelry-20261019'),
 account_id uuid not null references public.social_accounts(id),
 status text not null check (status in ('dispatched','verified')),
 board_id text, board_name text, privacy text, verified_at timestamptz,
 created_at timestamptz not null default now()
);
alter table public.pinterest_board_setup_operations enable row level security;
revoke all on public.pinterest_board_setup_operations from public,anon,authenticated;
grant select,insert,update on public.pinterest_board_setup_operations to service_role;
commit;
