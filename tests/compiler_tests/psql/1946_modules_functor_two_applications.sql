-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_Mine AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_A AS (SELECT
  SUM(Mine.x) AS t
FROM
  t_3_Mine AS Mine),
t_5_Shop_Product AS (SELECT * FROM (
  
    SELECT
      'a1' AS sku,
      'pen' AS name,
      2 AS price
   UNION ALL
  
    SELECT
      'a2' AS sku,
      'pad' AS name,
      5 AS price
   UNION ALL
  
    SELECT
      'b1' AS sku,
      'lamp' AS name,
      30 AS price
   UNION ALL
  
    SELECT
      'b2' AS sku,
      'desk' AS name,
      120 AS price
   UNION ALL
  
    SELECT
      'c1' AS sku,
      'mug' AS name,
      8 AS price
  
) AS UNUSED_TABLE_NAME  ),
t_4_B AS (SELECT
  SUM(Shop_Product.price) AS t
FROM
  t_5_Shop_Product AS Shop_Product)
SELECT
  t_0_A.t AS a,
  t_1_B.t AS b
FROM
  t_2_A AS t_0_A, t_4_B AS t_1_B;
