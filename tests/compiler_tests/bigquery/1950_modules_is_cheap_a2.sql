WITH t_0_Shop_Product AS (SELECT * FROM (
  
    SELECT
      "a1" AS sku,
      "pen" AS name,
      2 AS price
   UNION ALL
  
    SELECT
      "a2" AS sku,
      "pad" AS name,
      5 AS price
   UNION ALL
  
    SELECT
      "b1" AS sku,
      "lamp" AS name,
      30 AS price
   UNION ALL
  
    SELECT
      "b2" AS sku,
      "desk" AS name,
      120 AS price
   UNION ALL
  
    SELECT
      "c1" AS sku,
      "mug" AS name,
      8 AS price
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS ok
FROM
  t_0_Shop_Product AS Shop_Product
WHERE
  (Shop_Product.price < 10) AND
  ("a2" = Shop_Product.sku);
