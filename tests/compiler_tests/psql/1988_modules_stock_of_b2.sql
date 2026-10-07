-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Shop_Stock AS (SELECT * FROM (
  
    SELECT
      'a1' AS sku,
      100 AS qty
   UNION ALL
  
    SELECT
      'a2' AS sku,
      40 AS qty
   UNION ALL
  
    SELECT
      'b1' AS sku,
      3 AS qty
   UNION ALL
  
    SELECT
      'c1' AS sku,
      0 AS qty
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Shop_Stock.qty AS qty
FROM
  t_0_Shop_Stock AS Shop_Stock
WHERE
  (Shop_Stock.sku = 'b2');
