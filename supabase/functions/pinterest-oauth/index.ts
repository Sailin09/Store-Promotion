import { makeHandler } from './core.mjs';
Deno.serve(makeHandler((key: string) => Deno.env.get(key) ?? ''));
