// Each call still uses the database's atomic claim and all existing publishing gates.
// Never retry an invocation: an ambiguous outcome must be reconciled first.
export async function runPublisherBatch(invoke, report) {
  let published = 0;
  for (let job = 1; job <= 10; job++) {
    const result = await invoke();
    report(result);
    if (result.status === 'published') {
      published++;
      continue;
    }
    if (result.status === 'idle' || result.status === 'blocked') {
      return { status: result.status, published, jobs: job };
    }
    throw new Error('Publisher returned an unresolved outcome; batch stopped');
  }
  return { status: 'batch_limit', published, jobs: 10 };
}
