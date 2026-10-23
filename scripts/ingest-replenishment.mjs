import {spawnSync} from 'node:child_process';
import {readBatches} from './replenishment-batch.mjs';
const literal=value=>"'"+JSON.stringify(value).replaceAll("'","''")+"'";
function sql(query){
 const r=spawnSync('psql',['--dbname',process.env.SUPABASE_DB_URL,'-X','-At','-v','ON_ERROR_STOP=1'],{input:query,encoding:'utf8',timeout:60000});
 if(r.status!==0)throw new Error('Database validation or ingestion failed');
 return r.stdout.trim();
}
try {
 if(!process.env.SUPABASE_DB_URL||!process.env.SUPABASE_ACCESS_TOKEN)throw new Error('Missing deployment configuration');
 const batches=readBatches(new URL('../operations/replenishment/',import.meta.url));
 const existing=new Set(JSON.parse(sql("select coalesce(json_agg(etsy_listing_id),'[]'::json) from public.products;")));
 const pending=batches.flatMap(b=>b.items.filter(i=>!existing.has(i.listing_id)).map(item=>({batch:b.name,item})));
 if(pending.length===0){console.log(JSON.stringify({status:'no_new_verified_material',inserted:0}));process.exit(0);}
 const res=await fetch('https://api.supabase.com/v1/projects/czexstqnkogfvqyjvatr/api-keys?reveal=true',{
 headers:{Authorization:`Bearer ${process.env.SUPABASE_ACCESS_TOKEN}`},signal:AbortSignal.timeout(15000)});
 if(!res.ok)throw new Error('Cannot read invocation credential');
 const key=(await res.json()).find(k=>k.name==='service_role')?.api_key;
 if(!key)throw new Error('Missing invocation credential');
 console.log('::add-mask::'+key);
 const boards=new Map();let inserted=0,failed=0;
 for(const {batch,item} of pending){
  try{
   if(Date.now()-Date.parse(item.checked_at)>86400000||!Number.isFinite(Date.parse(item.checked_at))||Date.parse(item.checked_at)>Date.now())throw new Error('Source verification expired');
   if(!boards.has(item.handle)){
    const response=await fetch('https://czexstqnkogfvqyjvatr.supabase.co/functions/v1/pinterest-trial-demo',{
     method:'POST',headers:{Authorization:`Bearer ${key}`,'x-publisher-key':key,'Content-Type':'application/json'},
     body:JSON.stringify({action:'inspect',handle:item.handle}),signal:AbortSignal.timeout(100000)});
    const body=await response.json();
    if(!response.ok||body.status!=='inspected'||body.handle?.toLowerCase()!==item.handle.toLowerCase())throw new Error('Live account verification failed');
    boards.set(item.handle,body.boards);
   }
   if(!boards.get(item.handle)?.some(b=>b.id===item.board_id))throw new Error('Owned public Board verification failed');
   const url=new URL(item.image_url);
   if(url.protocol!=='https:'||url.hostname!=='i.etsystatic.com'||url.username||url.password||url.port)throw new Error('Invalid image source');
   const image=await fetch(url,{method:'HEAD',redirect:'error',signal:AbortSignal.timeout(15000)});
   if(!image.ok||!image.headers.get('content-type')?.startsWith('image/'))throw new Error('Image unavailable');
   const result=JSON.parse(sql(`
begin;
select pg_advisory_xact_lock(1617125,13);
with candidate as (select * from jsonb_to_record(${literal(item)}::jsonb) as i(shop text,handle text)),
stock as (select count(*) as n from public.publish_queue q
 join public.shops s on s.id=q.shop_id join public.social_accounts a on a.id=q.social_account_id
 join public.products p on p.id=q.product_id join public.content_variants cv on cv.id=q.content_variant_id
 join public.pinterest_publish_reviews r on r.queue_id=q.id, candidate i
 where s.shop_name=i.shop and a.handle=i.handle and q.platform='pinterest' and q.status in ('ready','scheduled')
 and p.listing_status='active' and cv.status='ready' and r.snapshot=public.pinterest_publish_snapshot(q.id)
 and r.listing_checked_at>now()-interval '29 days' and r.reviewed_at>now()-interval '29 days')
select case when n>=3 then jsonb_build_object('inserted',0,'skipped_target_met',1)
 else public.replenish_verified_products(${literal([item])}::jsonb,${literal(batch)}::jsonb #>> '{}') end from stock;
commit;`).split('\n').find(line=>line.startsWith('{')));
   inserted+=result.inserted;existing.add(item.listing_id);
   console.log(JSON.stringify({batch,shop:item.shop,listing_id:item.listing_id,...result}));
  }catch(error){failed++;console.log(JSON.stringify({batch,shop:item.shop,listing_id:item.listing_id,status:'blocked',reason:error.message}));}
 }
 console.log(JSON.stringify({inserted,failed,pending:pending.length}));
 if(failed)process.exitCode=1;
}catch(error){console.error(error.message);process.exitCode=1;}
