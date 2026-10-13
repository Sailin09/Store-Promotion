begin read only;
select json_build_object('enabled',enabled,'access_tier',access_tier) from pinterest_publish_settings where singleton;
select json_build_object('queue_id',q.id,'queue_status',q.status,'attempt_state',a.state,'pin_id',a.pin_id,'error',a.error_code,'finished_at',a.finished_at,'history_pin_id',h.external_post_id,'history_url',h.external_url,'published_at',h.published_at) from publish_queue q left join pinterest_publish_attempts a on a.queue_id=q.id left join publish_history h on h.content_variant_id=q.content_variant_id and h.platform='pinterest' where q.id in ('69dbd819-d043-4910-a7df-379f585539e2','6344e1e9-a294-4207-b9dc-d198439d26f2');
commit;
