import {readdirSync,readFileSync} from 'node:fs';
export function validateBatch(items) {
 if(!Array.isArray(items)||items.length<1||items.length>20)throw new Error('Batch must contain 1-20 items');
 const ids=new Set();
 for(const item of items){
  if(!/^\d+$/.test(item.listing_id)||ids.has(item.listing_id))throw new Error('Duplicate or invalid listing');
  ids.add(item.listing_id);
  if(item.available!==true||item.visual_verified!==true||typeof item.evidence!=='string'||item.evidence.trim().length<30)
   throw new Error('Source and visual evidence required');
 }
 return items;
}
export function readBatches(directory) {
 return readdirSync(directory).filter(name=>/^batch-[a-zA-Z0-9-]+\.json$/.test(name)).sort()
  .map(name=>({name:name.slice(0,-5),items:validateBatch(JSON.parse(readFileSync(new URL(name,directory),'utf8')))}));
}
