import { readFileSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
// Only the administrator-reviewed repository batch is accepted, not workflow free text.
try {
 const items=JSON.parse(readFileSync(new URL('../operations/materials-2026-10-23-b15.json',import.meta.url),'utf8'));
 const token=process.env.SUPABASE_ACCESS_TOKEN;
 if(!token||!process.env.SUPABASE_DB_URL)throw new Error('Missing deployment configuration');
 const res=await fetch('https://api.supabase.com/v1/projects/czexstqnkogfvqyjvatr/api-keys?reveal=true',{
  headers:{Authorization:`Bearer ${token}`},signal:AbortSignal.timeout(15000)});
 if(!res.ok)throw new Error('Cannot read project invocation credential');
 const key=(await res.json()).find(k=>k.name==='service_role')?.api_key;
 if(!key)throw new Error('Missing invocation credential');
 console.log('::add-mask::'+key);
 for(const handle of new Set(items.map(x=>x.handle))){
  const response=await fetch('https://czexstqnkogfvqyjvatr.supabase.co/functions/v1/pinterest-trial-demo',{
   method:'POST',headers:{Authorization:`Bearer ${key}`,'x-publisher-key':key,'Content-Type':'application/json'},
   body:JSON.stringify({action:'inspect',handle}),signal:AbortSignal.timeout(100000)});
  const inspection=await response.json();
  if(!response.ok||inspection.status!=='inspected'||inspection.handle?.toLowerCase()!==handle.toLowerCase()
   ||items.filter(x=>x.handle===handle).some(x=>!inspection.boards?.some(b=>b.id===x.board_id)))
   throw new Error('Live owned/public Board verification failed');
  console.log(JSON.stringify({board_verification:'passed',handle,boards:inspection.boards}));
 }
 for(const item of items){
  const url=new URL(item.image_url);
  if(url.protocol!=='https:'||url.hostname!=='i.etsystatic.com'||url.username||url.password||url.port)throw new Error('Invalid image source');
  const response=await fetch(url,{method:'HEAD',redirect:'error',signal:AbortSignal.timeout(15000)});
  if(!response.ok||!response.headers.get('content-type')?.startsWith('image/'))throw new Error('Image unavailable');
 }
 const literal="'"+JSON.stringify(items).replaceAll("'","''")+"'";
 const sql=`select public.replenish_verified_products(${literal}::jsonb,'daily-20261023-b15');`;
 const result=spawnSync('psql',['--dbname',process.env.SUPABASE_DB_URL,'-X','-At','-v','ON_ERROR_STOP=1'],{input:sql,encoding:'utf8',
  env:{...process.env,PGDATABASE:process.env.SUPABASE_DB_URL},timeout:60000});
 if(result.status!==0){console.error(result.stderr);throw new Error('Material ingestion failed');}
 console.log(result.stdout.trim());
}catch(error){console.error(error.message);process.exitCode=1;}
