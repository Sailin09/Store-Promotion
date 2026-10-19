export const HANDLE='cindyzhang62';
export const NAME='Jewelry & Accessories';
export function verified(b){return /^\d+$/.test(b?.id||'') && b.owner?.username?.toLowerCase()===HANDLE && b.privacy==='PUBLIC' && b.is_ads_only!==true && b.name===NAME;}
export async function ensureBoard({profile,scopes,list,claim,create,get,save}){
 if(profile.username?.toLowerCase()!==HANDLE)throw new Error('account_mismatch');
 if(!['boards:read','boards:write'].every(s=>scopes.includes(s)))throw new Error('scope_missing');
 const boards=await list();const matches=boards.filter(b=>b.name===NAME);
 if(matches.length){if(matches.length!==1||!verified(matches[0]))throw new Error('ambiguous_or_private_board');const b=await get(matches[0].id);if(!verified(b))throw new Error('board_verification');await save(b);return {status:'verified_existing',board:b};}
 // Durable insert precedes the only POST. A prior attempt cannot dispatch again.
 if(!await claim())throw new Error('prior_attempt_requires_reconciliation');
 const b=await create({name:NAME,description:'Jewelry and accessory ideas from ChicDecorHK and PearlsTreasuresArt. Explore individual pieces and their product details.',privacy:'PUBLIC'});
 if(!/^\d+$/.test(b?.id||''))throw new Error('uncertain_create');
 const confirmed=await get(b.id);if(!verified(confirmed))throw new Error('board_verification');await save(confirmed);return {status:'created_verified',board:confirmed};
}
