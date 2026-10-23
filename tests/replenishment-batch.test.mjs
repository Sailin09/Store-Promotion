import test from 'node:test';
import assert from 'node:assert/strict';
import {validateBatch} from '../scripts/replenishment-batch.mjs';
const item={listing_id:'123',available:true,visual_verified:true,evidence:'Live listing and original image inspected; correct shop and in-stock options.'};
test('reject missing source/visual verification before invoking services',()=>{
 for(const change of [{available:false},{visual_verified:false},{evidence:''}])assert.throws(()=>validateBatch([{...item,...change}]));
});
test('reject duplicate listings and oversized batch',()=>{
 assert.throws(()=>validateBatch([item,item]));
 assert.throws(()=>validateBatch(Array.from({length:21},(_,i)=>({...item,listing_id:String(i)}))));
 assert.deepEqual(validateBatch([item]),[item]);
});
