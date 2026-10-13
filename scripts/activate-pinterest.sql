begin;
set local statement_timeout='20s';
select pg_advisory_xact_lock(1617125,13);
do $$ begin
 if not exists(select 1 from pinterest_publish_settings where singleton and access_tier='standard' and standard_verified_at is not null and length(trim(approval_evidence))>0) then raise exception 'Standard verification required'; end if;
 if not exists(select 1 from pinterest_publish_reviews r join publish_queue q on q.id=r.queue_id where q.status='ready' and r.snapshot=pinterest_publish_snapshot(q.id) and r.listing_checked_at>now()-interval '30 days') then raise exception 'No current reviewed item'; end if;
 if exists(select 1 from pinterest_publish_attempts where state in ('prepared','dispatched','uncertain')) then raise exception 'Unresolved publishing attempt'; end if;
end $$;
update pinterest_publish_settings set enabled=true where singleton and access_tier='standard';
select json_build_object('enabled',enabled,'access_tier',access_tier) from pinterest_publish_settings where singleton;
commit;
