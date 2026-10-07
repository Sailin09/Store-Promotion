'use strict';
const endpoint='https://czexstqnkogfvqyjvatr.supabase.co/functions/v1/pinterest-oauth';
const params=new URLSearchParams(location.search);
// Remove authorization codes from the address bar before making further requests.
if(location.search)history.replaceState(null,'',location.pathname);
const form=document.getElementById('connect'), status=document.getElementById('status'), button=document.getElementById('submit');
async function api(data){
  const response=await fetch(endpoint,{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(data),credentials:'omit',referrerPolicy:'no-referrer',signal:AbortSignal.timeout(60000)});
  const result=await response.json();if(!response.ok)throw new Error(result.error||'服务暂时不可用。');return result;
}
form.addEventListener('submit',async event=>{
  event.preventDefault();button.disabled=true;status.textContent='正在准备授权…';
  try{
    const proof=Array.from(crypto.getRandomValues(new Uint8Array(32)),b=>b.toString(16).padStart(2,'0')).join('');
    const key=document.getElementById('key').value;document.getElementById('key').value='';
    // Test storage before issuing state so disabled storage fails safely.
    sessionStorage.setItem('pinterest-pending',JSON.stringify({proof}));
    const result=await api({action:'start',account:document.getElementById('account').value,key,browserProof:proof});
    sessionStorage.setItem('pinterest-pending',JSON.stringify({proof,state:result.state}));
    const target=new URL(result.url);if(target.origin!=='https://www.pinterest.com'||target.pathname!=='/oauth/')throw new Error('授权地址无效。');
    location.assign(target.href);
  }catch(error){status.textContent=error.message==='Failed to fetch'?'授权服务尚未部署或暂时无法连接，请完成后台配置后再试。':error.message;button.disabled=false;}
});
async function callback(){
  if(!params.has('code')&&!params.has('error'))return;
  form.hidden=true;
  try{
    const pending=JSON.parse(sessionStorage.getItem('pinterest-pending')||'null');
    if(!pending||!pending.state||params.get('state')!==pending.state)throw new Error('授权来源无法确认。请在发起连接的同一浏览器标签页重新授权。');
    sessionStorage.removeItem('pinterest-pending');
    if(params.has('error'))throw new Error('你取消了授权，账号连接未保存。');
    status.textContent='正在验证账号并保存连接…';
    const result=await api({action:'complete',code:params.get('code'),state:pending.state,browserProof:pending.proof});
    status.textContent='已连接 @'+result.username+'\n'+result.message;
  }catch(error){status.textContent=error.message;}
}
callback();
