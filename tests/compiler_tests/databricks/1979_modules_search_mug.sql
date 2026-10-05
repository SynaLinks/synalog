WITH t_0_Shop_Product AS (SELECT * FROM VALUES
  ("a1", "pen", 2),
  ("a2", "pad", 5),
  ("b1", "lamp", 30),
  ("b2", "desk", 120),
  ("c1", "mug", 8)
AS UNUSED_TABLE_NAME(sku, name, price))
SELECT
  Shop_Product.sku AS sku,
  Shop_Product.name AS name
FROM
  t_0_Shop_Product AS Shop_Product ORDER BY sku NULLS LAST;
