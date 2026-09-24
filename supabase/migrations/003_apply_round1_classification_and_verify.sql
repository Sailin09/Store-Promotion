-- 003_apply_round1_classification_and_verify.sql
-- Apply first-round shop classification and verify initial registry integrity.

update shops set primary_group='G1/G2', primary_category='Curtains & cafe curtains', secondary_notes='Chair pads / soft home textiles also present', classification_confidence='High' where shop_code='SHOP-001';
update shops set primary_group='G1', primary_category='Curtains & cafe curtains', secondary_notes='Noren / room divider curtains; linen/cotton window textiles', classification_confidence='High' where shop_code='SHOP-002';
update shops set primary_group='G1', primary_category='Curtains', secondary_notes='Sheer / light-filtering window treatments', classification_confidence='Medium' where shop_code='SHOP-003';
update shops set primary_group='G1', primary_category='Curtains', secondary_notes='Blackout, linen blend, embroidered, sheer styles', classification_confidence='High' where shop_code='SHOP-004';
update shops set primary_group='G1', primary_category='Curtains', secondary_notes='Romantic / shabby chic / lace / tie-up styles', classification_confidence='High' where shop_code='SHOP-005';
update shops set primary_group='G1/G2', primary_category='Curtains', secondary_notes='Tie-up / balloon curtains; broader home-textile enrichment pending', classification_confidence='Medium' where shop_code='SHOP-006';
update shops set primary_group='G1/G2', primary_category='Curtains & valances', secondary_notes='Crochet tablecloths / table linens also present', classification_confidence='High' where shop_code='SHOP-007';
update shops set primary_group='G3', primary_category='Hangers & closet organization', secondary_notes='Bathroom shelves, hooks, racks, kitchen storage', classification_confidence='High' where shop_code='SHOP-008';
update shops set primary_group='G3', primary_category='Wooden hangers', secondary_notes='Suit, shirt, pants and camphor-wood hangers', classification_confidence='High' where shop_code='SHOP-009';
update shops set primary_group='G3/G6', primary_category='Wooden hangers', secondary_notes='Rack hooks, wood pulls, rattan trays, price-tag stands', classification_confidence='High' where shop_code='SHOP-010';
update shops set primary_group='G1/G2', primary_category='Curtains', secondary_notes='Table runners and tablecloths are important secondary categories', classification_confidence='High' where shop_code='SHOP-011';
update shops set primary_group='G1/G2', primary_category='French-style curtains', secondary_notes='Tablecloths, pillowcases, chair pads, bed canopy, apron', classification_confidence='High' where shop_code='SHOP-012';
update shops set primary_group='G1/G5', primary_category='Curtains / mixed lifestyle', secondary_notes='Also shell/statement jewelry; split by product lane', classification_confidence='High' where shop_code='SHOP-013';
update shops set primary_group='G1/G2', primary_category='French-style curtains', secondary_notes='Tablecloths, bed curtains, bedding, pillowcases, aprons, chair pads', classification_confidence='High' where shop_code='SHOP-014';
update shops set primary_group='G6', primary_category='Wooden home/storage objects', secondary_notes='Cable organizer boxes and DIY wood products; mixed wood-goods shop', classification_confidence='Medium' where shop_code='SHOP-015';
update shops set primary_group='G2/G7', primary_category='Home textiles & personalized pillows', secondary_notes='Chair cushions, sofa covers, curtains, pillow gifts', classification_confidence='High' where shop_code='SHOP-016';
update shops set primary_group='G3', primary_category='Wooden hangers', secondary_notes='Wood price tags, menu stands, place-card holders', classification_confidence='High' where shop_code='SHOP-017';
update shops set primary_group='G1/G2', primary_category='Lace & romantic curtains', secondary_notes='Bed canopy curtains, pillowcases, some aprons', classification_confidence='High' where shop_code='SHOP-018';
update shops set primary_group='G1', primary_category='Curtains', secondary_notes='Printed / botanical curtain styles', classification_confidence='Medium' where shop_code='SHOP-019';
update shops set primary_group='G4', primary_category='Fabric & sewing supplies', secondary_notes='Cotton embroidered fabrics / home-decor sewing material', classification_confidence='High' where shop_code='SHOP-020';
update shops set primary_group='G1', primary_category='Curtains', secondary_notes='Custom curtains, tier/cafe curtains, farmhouse/cottagecore', classification_confidence='High' where shop_code='SHOP-021';
update shops set primary_group='G4', primary_category='Specialty fabrics', secondary_notes='Silk, organza, embroidered, jacquard, couture/bridal textiles', classification_confidence='High' where shop_code='SHOP-022';
update shops set primary_group='G3/G7', primary_category='Fabric organizers', secondary_notes='Wall/door hanging organizers and textile storage', classification_confidence='High' where shop_code='SHOP-023';
update shops set primary_group='G5', primary_category='Shell jewelry', secondary_notes='Necklaces, earrings and coastal wearable accessories', classification_confidence='High' where shop_code='SHOP-024';
update shops set primary_group='G6', primary_category='Coastal / shell home decor', secondary_notes='Shell mirrors, candle holders, baskets, wall hangings, wood-bead curtains', classification_confidence='High' where shop_code='SHOP-025';
update shops set primary_group='G6', primary_category='Cabinet hardware', secondary_notes='Natural stone / crystal knobs and drawer pulls', classification_confidence='High' where shop_code='SHOP-026';
update shops set primary_group='G7', primary_category='Aprons', secondary_notes='French-country / vintage cotton apron dresses', classification_confidence='High' where shop_code='SHOP-027';
update shops set primary_group='G7/G2', primary_category='Decorative pillow covers', secondary_notes='Velvet/jacquard/floral cushion covers', classification_confidence='High' where shop_code='SHOP-028';
update shops set primary_group='G7', primary_category='Textile bags & accessories', secondary_notes='Jacquard cosmetic/travel bags; oriental fabric bags', classification_confidence='High' where shop_code='SHOP-029';
update shops set primary_group='G2', primary_category='Chair pads / seat cushions', secondary_notes='Linen-cotton dining chair cushions', classification_confidence='High' where shop_code='SHOP-030';

do $$
declare
  c integer;
  d integer;
begin
  select count(*) into c from shops where shop_code between 'SHOP-001' and 'SHOP-030';
  if c <> 30 then
    raise exception 'Initial registry integrity check failed: expected 30 shops, found %', c;
  end if;

  select count(*) - count(distinct shop_code) into d from shops;
  if d <> 0 then
    raise exception 'Duplicate shop_code values detected';
  end if;

  if exists (
    select 1 from shops
    where shop_code between 'SHOP-001' and 'SHOP-030'
      and (primary_group is null or primary_category is null)
  ) then
    raise exception 'Round-1 classification incomplete for one or more initial shops';
  end if;
end $$;
