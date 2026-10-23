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
   const result=JSON.parse(sql(`select public.replenish_verified_products(${literal([item])}::jsonb,${literal(batch)}::jsonb #>> '{}');`));
   inserted+=result.inserted;existing.add(item.listing_id);
   console.log(JSON.stringify({batch,shop:item.shop,listing_id:item.listing_id,...result}));
  }catch(error){failed++;console.log(JSON.stringify({batch,shop:item.shop,listing_id:item.listing_id,status:'blocked',reason:error.message}));}
 }
 console.log(JSON.stringify({inserted,failed,pending:pending.length}));
 if(failed)process.exitCode=1;
}catch(error){console.error(error.message);process.exitCode=1;}
