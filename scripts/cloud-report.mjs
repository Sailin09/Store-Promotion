import {spawnSync} from 'node:child_process';
import {readFileSync,writeFileSync,appendFileSync,mkdirSync} from 'node:fs';
import {pathToFileURL} from 'node:url';

export function renderReport(report, stock, recovery=[]) {
 const lines=['# Pinterest 云端运行报告',`核验时间：${report.captured_at}`,`发布基线：${report.baseline_at}，累计 ${report.baseline_total} 条。`,''];
 for(const a of report.accounts) {
  lines.push(`## ${a.account} · ${a.handle}`,`实际新增 ${a.pins.length} 条；累计 ${a.total} 条；待发布 ${a.ready} 条。`);
  if(!a.pins.length) lines.push('尚未确认新增 Pin；不能以工作流成功代替发布成功。');
  for(const p of a.pins) {
   const url=/^\d+$/.test(p.pin_id||'') ? `https://www.pinterest.com/pin/${p.pin_id}/` : null;
   lines.push(url ? `- [Pin ${p.pin_id}](${url}) · ${p.shop} · 商品 ${p.listing_id} · ${p.published_at}` : '- 发布记录缺少有效 Pin ID，链接未确认。');
  }
  for(const a1 of a.attempts) lines.push(`- 未完成尝试：${a1.queue_id}，${a1.state}，${a1.error||'无错误代码'}。`);
  lines.push('');
 }
 const deficit=stock.reduce((n,x)=>n+x.deficit,0);
 lines.push('## 素材库存',`${stock.length} 条店铺/账号路线，可用 ${stock.reduce((n,x)=>n+x.usable,0)} 条，按每路线至少 3 条计算，缺口 ${deficit} 条。`);
 for(const s of stock.filter(s=>s.deficit>0)) lines.push(`- ${s.shop} / ${s.account}：可用 ${s.usable}，待补 ${s.deficit}。`);
 lines.push('新品发现与图片核验由独立的 ChatGPT 云端补货任务负责；本报告仅检查库存和发布。定时任务配置及首次实际入库验证状态见 operations/replenishment/cloud-automation-audit-20261023.json；未经图片核验的商品不会入队。', '', '## 调度与恢复');
 for(const s of report.scheduler) lines.push(`- 发布调度：${s.active?'启用':'停用'}，${s.schedule}。`);
 for(const r of report.requests.slice(0,10)) lines.push(`- ${r.requested_at}：HTTP ${r.http_status??'待完成'}，${r.outcome??'待完成'}，${r.reason??'无附加原因'}。`);
 for(const r of recovery) lines.push(`- ${r}`);
 lines.push('未知失败或结果不确定的发布尝试保留现场，不清除去重记录；需进一步排查的情况会在本报告保留。');
 return lines.join('\n')+'\n';
}

function sql(query) {
 const r=spawnSync('psql',['--dbname',process.env.SUPABASE_DB_URL,'-X','-Atq','-v','ON_ERROR_STOP=1'],{input:query,encoding:'utf8',timeout:60000});
 if(r.status!==0) throw new Error('Cloud report database query failed');
 return r.stdout.trim();
}
async function main() {
 const report=JSON.parse(sql('select public.pinterest_cloud_report();'));
 const stock=sql(readFileSync(new URL('./replenishment-plan.sql',import.meta.url),'utf8')).split('\n').filter(l=>l.startsWith('{')).map(l=>JSON.parse(l).replenishment_plan);
 const recovery=[];
 const evening=process.env.REPORT_MODE==='evening';
 let snapshot=null;
 if(evening) {
  sql('select public.capture_pinterest_evening_report();');
  const raw=sql("select report from public.pinterest_cloud_reports where report_key='2026-10-23-evening';");
  if(!raw) throw new Error('Evening snapshot not yet available');
  snapshot=JSON.parse(raw);
  if(!report.scheduler.some(s=>s.active && s.schedule==='*/5 * * * *')) {
   const result=spawnSync(process.execPath,['scripts/install-pinterest-scheduler.mjs'],{encoding:'utf8',timeout:120000});
   recovery.push(result.status===0?'已恢复发布调度，原有发布门槛保持不变。':'发布调度恢复失败，需要进一步排查。');
  }
  if(report.accounts.some(a=>a.pins.length===0 || a.attempts.length>0)) {
   const result=spawnSync(process.execPath,['scripts/run-pinterest-publisher.mjs'],{encoding:'utf8',timeout:300000});
   const outcomes=result.stdout.split('\n').filter(l=>l.startsWith('{')).flatMap(l=>{try{return [JSON.parse(l)]}catch{return []}});
   recovery.push(`执行一次受现有门槛保护的补偿检查：${result.status===0?'调用完成':'失败或结果不确定'}。`);
   for(const o of outcomes) recovery.push(JSON.stringify(o));
  }
 }
 const final=evening?JSON.parse(sql('select public.pinterest_cloud_report();')):report;
 let body=renderReport(snapshot||final,stock,recovery);
 if(snapshot) body+='\n---\n## 补偿检查后的实时结果\n'+renderReport(final,stock);
 const run=`https://github.com/${process.env.GITHUB_REPOSITORY}/actions/runs/${process.env.GITHUB_RUN_ID}`;
 body+=`\n[本次云端运行](${run})\n`;
 mkdirSync('cloud-output',{recursive:true});
 writeFileSync('cloud-output/report.md',body);
 writeFileSync('cloud-output/report.json',JSON.stringify({snapshot,final,stock,recovery},null,2));
 if(process.env.GITHUB_STEP_SUMMARY)appendFileSync(process.env.GITHUB_STEP_SUMMARY,body);
 const title=evening?'Pinterest 2026-10-23 21:35 发布复核':'Pinterest 云端库存与运行状态';
 const headers={Authorization:`Bearer ${process.env.GITHUB_TOKEN}`,Accept:'application/vnd.github+json','Content-Type':'application/json','X-GitHub-Api-Version':'2022-11-28'};
 const base=`https://api.github.com/repos/${process.env.GITHUB_REPOSITORY}/issues`;
 // Search all authors: Actions creates issues as github-actions[bot].
 const all=await fetch(base+'?state=all&per_page=100',{headers});
 if(!all.ok)throw new Error('Cannot read cloud report issue');
 const issue=(await all.json()).find(x=>x.title===title&&!x.pull_request);
 const deficit=stock.reduce((n,x)=>n+x.deficit,0);
 const marker=`<!-- stock-deficit:${deficit} -->`;
 body+='\n'+marker+'\n';
 const response=await fetch(issue?`${base}/${issue.number}`:base,{method:issue?'PATCH':'POST',headers,body:JSON.stringify({title,body,state:'open'})});
 if(!response.ok)throw new Error('Cannot save cloud report issue');
 const saved=await response.json();console.log(JSON.stringify({report_url:saved.html_url,mode:process.env.REPORT_MODE,deficit:stock.reduce((n,x)=>n+x.deficit,0)}));
 if(issue && !evening && deficit>0 && !issue.body?.includes(marker)) {
  const notification=await fetch(`${base}/${saved.number}/comments`,{method:'POST',headers,body:JSON.stringify({body:`库存缺口变为 ${deficit} 条，需要补充已核验素材。\n\n${body}`})});
  if(!notification.ok)throw new Error('Cannot notify stock deficit');
 }
 if(evening&&final.accounts.some(a=>a.pins.length===0||a.attempts.some(t=>['failed','uncertain'].includes(t.state))))process.exitCode=1;
}
if(process.argv[1]&&import.meta.url===pathToFileURL(process.argv[1]).href) main().catch(()=>{console.error('Cloud report failed; inspect workflow steps. No credentials logged.');process.exitCode=1;});
