// GitHub Actions only. No credentials or Pinterest token bodies are printed.
const ref='czexstqnkogfvqyjvatr';
try {
 const token=process.env.SUPABASE_ACCESS_TOKEN;
 if(!token){console.log(JSON.stringify({status:'blocked',reason:'supabase_automation_credential_required'}));process.exit(0);}
 const res=await fetch(`https://api.supabase.com/v1/projects/${ref}/api-keys?reveal=true`,{headers:{Authorization:`Bearer ${token}`},signal:AbortSignal.timeout(15000)});
 if(!res.ok)throw new Error(`supabase_api_keys_request_failed:${res.status}`);
 const keys=await res.json();
 const key=keys.find(k=>k.name==='service_role')?.api_key;
 if(!key)throw new Error('Legacy service-role invocation key unavailable');
 console.log('::add-mask::'+key);
 const result=await fetch(`https://${ref}.supabase.co/functions/v1/pinterest-board-setup`,{method:'POST',headers:{Authorization:`Bearer ${key}`,'x-publisher-key':key,'Content-Type':'application/json'},body:JSON.stringify({}),signal:AbortSignal.timeout(100000)});
 const contentType=result.headers.get('content-type')||null;
 const raw=await result.text();
 let body={};
 try { body=raw?JSON.parse(raw):{}; } catch { body={error:'non_json_response'}; }
 console.log(JSON.stringify({status:body.status||'error',http_status:result.status,content_type:contentType,account_type:body.account_type,reconciliation:body.reconciliation,handle:body.handle,boards:body.boards,board:body.board,has_more:body.has_more,reason:body.reason,queue_id:body.queue_id,attempt_id:body.attempt_id,pin_id:body.pin_id,url:body.url,error:body.error,diagnostic:body.diagnostic}));
 if(!result.ok)process.exitCode=1;
} catch (error) { const name=error?.name||'Error'; const message=error?.message||'unknown'; console.error(JSON.stringify({status:'error',stage:'publisher_invocation',error_name:name,error_message:message.slice(0,240)})); process.exitCode=1; }
