// GitHub Actions only. No credentials or Pinterest token bodies are printed.
const ref='czexstqnkogfvqyjvatr';
try {
 const token=process.env.SUPABASE_ACCESS_TOKEN;
 if(!token){console.log(JSON.stringify({status:'blocked',reason:'supabase_automation_credential_required'}));process.exit(0);}
 const res=await fetch(`https://api.supabase.com/v1/projects/${ref}/api-keys?reveal=true`,{headers:{Authorization:`Bearer ${token}`},signal:AbortSignal.timeout(15000)});
 if(!res.ok)throw new Error('Cannot obtain worker invocation credential');
 const keys=await res.json();
 const key=keys.find(k=>k.name==='service_role')?.api_key;
 if(!key)throw new Error('Legacy service-role invocation key unavailable');
 console.log('::add-mask::'+key);
 const result=await fetch(`https://${ref}.supabase.co/functions/v1/pinterest-trial-demo`,{method:'POST',headers:{Authorization:`Bearer ${key}`,'x-publisher-key':key,'Content-Type':'application/json'},body:'{"action":"inspect"}',signal:AbortSignal.timeout(100000)});
 const body=await result.json();
 // Whitelist only non-sensitive outcome fields.
 console.log(JSON.stringify({status:body.status,handle:body.handle,boards:body.boards,has_more:body.has_more,reason:body.reason,queue_id:body.queue_id,attempt_id:body.attempt_id,pin_id:body.pin_id,url:body.url,error:body.error}));
 if(!result.ok)process.exitCode=1;
} catch {console.error('Publisher invocation failed; inspect durable attempts before retrying.');process.exitCode=1;}
