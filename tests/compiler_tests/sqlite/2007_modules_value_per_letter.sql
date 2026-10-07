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
  SUBSTR(Shop_Product.sku, 1, 1) AS letter,
  SUM(((Shop_Product.price) * (Shop_Stock.qty))) AS t
FROM
  t_0_Shop_Product AS Shop_Product, t_1_Shop_Stock AS Shop_Stock
WHERE
  (Shop_Stock.sku = Shop_Product.sku)
GROUP BY SUBSTR(Shop_Product.sku, 1, 1) ORDER BY letter NULLS LAST, t NULLS LAST;
