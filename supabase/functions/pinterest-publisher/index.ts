import { makePublisher } from './core.mjs';
Deno.serve(makePublisher(name => Deno.env.get(name)));
