-- Validate the incoming project credential without exposing secrets or data.
create function public.authenticate_pinterest_publisher() returns boolean
language sql stable security invoker set search_path='' as $$
 select current_user = 'service_role';
$$;
revoke all on function public.authenticate_pinterest_publisher() from public, anon, authenticated;
grant execute on function public.authenticate_pinterest_publisher() to service_role;
