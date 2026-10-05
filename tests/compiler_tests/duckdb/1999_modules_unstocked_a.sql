-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Shop_Product AS (SELECT * FROM (
  
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
t_1_Shop_Stock AS (SELECT * FROM (
  
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
  Shop_Product.sku AS sku
FROM
  t_0_Shop_Product AS Shop_Product
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Shop_Stock AS Shop_Stock, (select unnest([0]) as unnested_pod) as x_4
  WHERE
    (Shop_Stock.sku = Shop_Product.sku)) IS NULL) AND
  (SUBSTR(Shop_Product.sku, 1, 1) = 'a');
