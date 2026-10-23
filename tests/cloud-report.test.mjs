import test from 'node:test';
import assert from 'node:assert/strict';
import {renderReport} from '../scripts/cloud-report.mjs';
const base={captured_at:'2026-10-23T13:35:00Z',baseline_at:'2026-10-23T06:45:08Z',baseline_total:62,accounts:[{account:'P1',handle:'icyndizhang',total:19,ready:55,pins:[{pin_id:'123',url:'https://wrong.example',shop:'Chtte',listing_id:'444',published_at:'2026-10-23T13:00:00Z'}],attempts:[]}],scheduler:[],requests:[]};
test('reports durable Pin IDs as canonical links and real deficits',()=>{
 const result=renderReport(base,[{shop:'Chtte',account:'P3',usable:1,deficit:2}]);
 assert.match(result,/https:\/\/www.pinterest.com\/pin\/123\//);
 assert.doesNotMatch(result,/wrong.example/);
 assert.match(result,/缺口 2 条/);
});
test('idle without real pins never reports success',()=>{
 const result=renderReport({...base,accounts:[{...base.accounts[0],pins:[],attempts:[{queue_id:'q',state:'uncertain',error:'timeout'}]}],requests:[{requested_at:'now',http_status:200,outcome:'idle'}]},[]);
 assert.match(result,/尚未确认新增 Pin/);assert.match(result,/uncertain/);assert.match(result,/idle/);
});
