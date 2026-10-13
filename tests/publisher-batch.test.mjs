import test from 'node:test';
import assert from 'node:assert/strict';
import {runPublisherBatch} from '../scripts/publisher-batch.mjs';
test('drains successful eligible jobs sequentially and stops at idle',async()=>{
 let active=0,calls=0;const logs=[];
 const result=await runPublisherBatch(async()=>{assert.equal(active,0);active++;await Promise.resolve();active--;return {status:++calls<4?'published':'idle'};},x=>logs.push(x));
 assert.deepEqual(result,{status:'idle',published:3,jobs:4});assert.equal(logs.length,4);
});
test('bounds each run to ten even when more jobs are eligible',async()=>{
 let calls=0;const result=await runPublisherBatch(async()=>{calls++;return {status:'published'};},()=>{});
 assert.equal(calls,10);assert.deepEqual(result,{status:'batch_limit',published:10,jobs:10});
});
test('does not retry a timeout after a possible dispatch',async()=>{
 let calls=0;await assert.rejects(runPublisherBatch(async()=>{calls++;throw new Error('timeout');},()=>{}));assert.equal(calls,1);
});
test('stops on blocked without issuing further requests',async()=>{
 let calls=0;const result=await runPublisherBatch(async()=>{calls++;return {status:'blocked'};},()=>{});assert.equal(calls,1);assert.equal(result.published,0);
});
test('stops on unresolved or unexpected status',async()=>{
 for(const status of ['uncertain','error',undefined]){let calls=0;await assert.rejects(runPublisherBatch(async()=>{calls++;return {status};},()=>{}));assert.equal(calls,1);}
});
