// Manual evidence capture only. A reviewer must inspect the saved listing and image before ingest.
const { chromium } = require('playwright-core');
const fs = require('node:fs');
const path = require('node:path');
const out = 'etsy-evidence';
const base = 'operations/replenishment';
const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
async function main() {
  fs.mkdirSync(out,{recursive:true});
  const latest = fs.readdirSync(base).filter(f=>/^cloud-run-\d+-\d+\.json$/.test(f)).sort().pop();
  const record = JSON.parse(fs.readFileSync(path.join(base,latest)));
  const plan = record.verification?.replenishment_plan;
  if (!Array.isArray(plan) || Date.now()-Date.parse(record.observed_at)>86400000) throw Error('fresh_plan_required');
  const known = new Set(plan.flatMap(r=>r.known_listing_ids.map(String)));
  const browser = await chromium.launch({channel:'chrome',headless:true});
  const page = await browser.newPage();
  let blocked;
  const results = [];
  page.on('response',r=>{
    if (new URL(r.url()).hostname.endsWith('etsy.com') && [403,429].includes(r.status())) blocked='HTTP '+r.status();
  });
  await page.route('**/*',route=>blocked ? route.abort() : route.continue());
  async function visit(url) {
    if (blocked) throw Error(blocked);
    const response = await page.goto(url,{waitUntil:'domcontentloaded',timeout:30000});
    const body = await page.locator('body').innerText({timeout:10000});
    if (blocked || !response?.ok() || /verify you are human|captcha|access denied|enable javascript and disable any ad blocker|security challenge/i.test(body)) throw Error(blocked||'access_or_challenge');
    return body;
  }
  try {
    for (const shop of ['ChicDecorHK','NngGoods','PearlsTreasuresArt','NinaJiaStudio','QuGifts']) {
      const route = plan.find(r=>r.shop===shop && ['P4','P5'].includes(r.account));
      if (!route || route.usable>=7) continue;
      await visit('https://www.etsy.com/shop/'+shop);
      const links=await page.locator('a[href*="/listing/"]').evaluateAll(nodes=>nodes.map(n=>n.href));
      const candidate=links.map(x=>new URL(x)).find(x=>x.hostname==='www.etsy.com' && /^\/listing\/\d+\//.test(x.pathname) && !known.has(x.pathname.split('/')[2]));
      if (!candidate) {results.push({shop,status:'no_candidate'});continue;}
      await delay(12000);
      const url=candidate.origin+candidate.pathname;
      const body=await visit(url);
      const id=candidate.pathname.split('/')[2];
      const image=await page.locator('meta[property="og:image"]').first().getAttribute('content',{timeout:5000});
      await page.screenshot({path:path.join(out,id+'.png')});
      fs.writeFileSync(path.join(out,id+'.txt'),body);
      results.push({shop,id,url,final_url:page.url(),image,observed_at:new Date().toISOString(),status:'awaiting_visual_and_seller_review'});
      known.add(id);
      await delay(12000);
    }
  } catch (e) {
    const retry=new Date(Date.now()+86400000).toISOString();
    results.push({status:'stopped',reason:blocked||e.message.split('\n')[0],retry_not_before:retry});
    process.exitCode=1;
  } finally {
    console.log(JSON.stringify(results));
    fs.writeFileSync(path.join(out,'report.json'),JSON.stringify(results,null,2));
    await browser.close();
  }
}
main().catch(e=>{console.error(e.message);process.exitCode=1;});
