import { makePublisher } from '../pinterest-publisher/core.mjs';
// No cron, request-selected mode, queue activation or production history writes.
Deno.serve(makePublisher(name => Deno.env.get(name), fetch, 'trial'));
