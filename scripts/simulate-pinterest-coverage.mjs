import {spawnSync} from 'node:child_process';

function sql(query) {
 const r=spawnSync('psql',['--dbname',process.env.SUPABASE_DB_URL,'-X','-Atq','-v','ON_ERROR_STOP=1'],{input:query,encoding:'utf8',timeout:60000});
 if(r.status!==0) throw new Error('Schedule coverage query failed');
 return r.stdout.trim();
}
const handles="'icyndizhang','sailing_981','mydecorshop','cindyzhang62','ivy5205'";
const query=`
select extract(epoch from now())*1000;
select json_build_object(
 'queue_id',q.id::text,'shop_id',q.shop_id::text,'account_id',a.id::text,'product_id',q.product_id::text,'shop',s.shop_name,'account',a.account_name,'handle',a.handle,
 'status',q.status,'due_at',coalesce(q.scheduled_at,now()),'priority',q.priority,'created_at',q.created_at,
 'listing_checked_at',rev.listing_checked_at,'reviewed_at',rev.reviewed_at,
 'snapshot_matches',rev.snapshot=public.pinterest_publish_snapshot(q.id),
 'source_matches',rev.source_url=p.etsy_url,'board_id',rev.board_id,
 'eligible_configuration',(
   (select enabled and access_tier='standard' and standard_verified_at is not null and length(trim(approval_evidence))>0 from public.pinterest_publish_settings limit 1)
   and s.status='active' and p.listing_status='active' and cv.status='ready' and a.active and rule.enabled
   and rule.max_posts_per_day>0 and rule.min_gap_hours>=0 and rule.evergreen_reuse_days>=0
   and a.account_status in ('authorized_trial','authorized_standard')
   and a.credential_reference='pinterest_oauth_credentials:'||a.id::text
   and exists(select 1 from public.pinterest_oauth_credentials c where c.social_account_id=a.id and lower(c.pinterest_username)=lower(a.handle))
   and rev.board_id is not null
   and exists(select 1 from public.shop_social_accounts m where m.shop_id=q.shop_id and m.social_account_id=a.id and m.platform=q.platform and m.active)
   and not exists(select 1 from public.pinterest_publish_attempts pa where pa.queue_id=q.id)
   and not exists(select 1 from public.publish_history h where h.content_variant_id=cv.id)
   and not exists(select 1 from public.pinterest_publish_attempts pa join public.publish_queue busy on busy.id=pa.queue_id where pa.state in ('prepared','dispatched','uncertain') and (busy.shop_id=q.shop_id or busy.social_account_id=a.id))
 ),
 'max_posts_per_day',rule.max_posts_per_day,'min_gap_hours',rule.min_gap_hours,'evergreen_reuse_days',rule.evergreen_reuse_days,
 'latest_shop_publish',(select max(h.published_at) from public.publish_history h where h.shop_id=q.shop_id and h.platform=q.platform),
 'shop_history_24h',(select coalesce(json_agg(h.published_at order by h.published_at),'[]'::json) from public.publish_history h where h.shop_id=q.shop_id and h.platform=q.platform and h.published_at>now()-interval '24 hours'),
 'latest_account_publish',(select max(h.published_at) from public.publish_history h where h.social_account_id=a.id and h.platform=q.platform),
 'latest_product_publish',(select max(h.published_at) from public.publish_history h where h.product_id=q.product_id and h.platform=q.platform)
)
from public.publish_queue q
join public.products p on p.id=q.product_id and p.shop_id=q.shop_id
join public.shops s on s.id=q.shop_id
join public.content_variants cv on cv.id=q.content_variant_id and cv.product_id=p.id and cv.shop_id=s.id and cv.platform='pinterest'
join public.social_accounts a on a.id=q.social_account_id and a.platform='pinterest'
join public.pinterest_publish_reviews rev on rev.queue_id=q.id
join public.promotion_rules rule on rule.shop_id=q.shop_id and rule.platform=q.platform and rule.rule_name='default-organic'
where q.platform='pinterest' and q.status in ('ready','scheduled') and a.handle in (${handles})
and rev.snapshot=public.pinterest_publish_snapshot(q.id) and rev.source_url=p.etsy_url
and rev.listing_checked_at between now()-interval '30 days' and now()
and rev.reviewed_at between now()-interval '30 days' and now()
order by q.priority,q.created_at;
`;
const raw=sql(query).split('\n').filter(Boolean);
const now=Number(raw.shift());
const items=raw.map(x=>JSON.parse(x)).filter(x=>x.eligible_configuration && x.snapshot_matches && x.source_matches);
const ms=v=>v==null?null:Date.parse(v);
for(const x of items){x.due=ms(x.due_at);x.created=ms(x.created_at);x.checked=ms(x.listing_checked_at);x.reviewed=ms(x.reviewed_at);x.shopLast=ms(x.latest_shop_publish);x.accountLast=ms(x.latest_account_publish);x.productLast=ms(x.latest_product_publish);x.shopHistory=(x.shop_history_24h||[]).map(ms).filter(Number.isFinite);x.done=false;}
const latestShop=new Map(), latestAccount=new Map(), latestProduct=new Map(), shopHistory=new Map();
for(const x of items){
 const sk=x.shop_id,ak=x.account_id,pk=x.product_id;
 if(!latestShop.has(sk)||x.shopLast>latestShop.get(sk))latestShop.set(sk,x.shopLast);
 if(!latestAccount.has(ak)||x.accountLast>latestAccount.get(ak))latestAccount.set(ak,x.accountLast);
 if(!latestProduct.has(pk)||x.productLast>latestProduct.get(pk))latestProduct.set(pk,x.productLast);
 if(!shopHistory.has(sk))shopHistory.set(sk,new Set());
 for(const h of x.shopHistory)shopHistory.get(sk).add(h);
}
const dayString=new Intl.DateTimeFormat('en-CA',{timeZone:'Asia/Shanghai',year:'numeric',month:'2-digit',day:'2-digit'}).format(new Date(now));
const first=Date.parse(dayString+'T00:00:00+08:00');
const horizon=first+7*86400000;
const published=[];
const tieGroups=new Map();
for(const x of items){const k=x.priority+'|'+x.created;if(!tieGroups.has(k))tieGroups.set(k,[]);tieGroups.get(k).push(x);}
const ambiguousTies=[...tieGroups.values()].filter(g=>g.length>1).reduce((n,g)=>n+g.length,0);
for(let t=Math.ceil(now/300000)*300000;t<horizon;t+=300000){
 const d=new Date(t);
 const bjtHour=(d.getUTCHours()+8)%24, bjtMinute=d.getUTCMinutes();
 if(!((bjtHour>=8&&bjtHour<11)||(bjtHour>=21&&bjtHour<23)))continue;
 const eligible=items.filter(x=>{
  if(x.done||x.due>t||t-x.checked>=30*86400000||t-x.reviewed>=30*86400000)return false;
  const shopLast=latestShop.get(x.shop_id),accountLast=latestAccount.get(x.account_id),productLast=latestProduct.get(x.product_id);
  if(shopLast!=null&&t-shopLast<Math.max(24,Number(x.min_gap_hours))*3600000)return false;
  if(accountLast!=null&&t-accountLast<2*3600000)return false;
  const history=[...(shopHistory.get(x.shop_id)||[])];
  if(history.filter(h=>t-h<24*3600000).length>=Number(x.max_posts_per_day))return false;
  if(productLast!=null&&t-productLast<Number(x.evergreen_reuse_days)*86400000)return false;
  return true;
 }).sort((a,b)=>Number(a.priority)-Number(b.priority)||a.created-b.created||String(a.shop).localeCompare(String(b.shop))||String(a.queue_id).localeCompare(String(b.queue_id)));
 if(!eligible.length)continue;
 const x=eligible[0];x.done=true;latestShop.set(x.shop_id,t);latestAccount.set(x.account_id,t);latestProduct.set(x.product_id,t);shopHistory.get(x.shop_id).add(t);published.push({account:x.account,shop:x.shop,queue_id:x.queue_id,at:new Date(t).toISOString()});
}
const days=new Map();
for(let i=0;i<7;i++)days.set(new Intl.DateTimeFormat('en-CA',{timeZone:'Asia/Shanghai'}).format(new Date(first+i*86400000)),{});
const accountNames=['P1','P2','P3','P4','P5'];
const accounts=Object.fromEntries(accountNames.map(a=>[a,{publish_slots:0,covered_days:0,days:[]}]));
const shops={};
for(const x of published){const day=new Intl.DateTimeFormat('en-CA',{timeZone:'Asia/Shanghai'}).format(new Date(x.at));const a=accounts[x.account];a.publish_slots++;if(!a.days.includes(day))a.days.push(day);const key=x.account+' / '+x.shop;shops[key]??={account:x.account,shop:x.shop,publish_slots:0,days:[]};shops[key].publish_slots++;if(!shops[key].days.includes(day))shops[key].days.push(day);}
for(const a of accountNames){accounts[a].days.sort();accounts[a].covered_days=accounts[a].days.length;}
const result={status:'simulated',as_of:new Date(now).toISOString(),timezone:'Asia/Shanghai',dates:[...days.keys()],scheduler_interval_minutes:5,queue_candidates:items.length,scheduled_slots:published.length,accounts,shops:Object.values(shops).sort((a,b)=>a.account.localeCompare(b.account)||a.shop.localeCompare(b.shop)),ambiguous_tie_items:ambiguousTies,confidence:'conditional_estimate',limitations:['Queue order uses priority then created_at; exact ties are shown as ambiguous and stable shop/queue ID is used only for this scenario.','Pinterest live account, board ownership/public visibility, and image reachability are rechecked at publish time and cannot be predicted here.','Real scheduler delays, failures, and database changes can reduce coverage.']};
console.log(JSON.stringify(result));
