WITH t_1_Shop_Product AS (SELECT * FROM VALUES
  ("a1", "pen", 2),
  ("a2", "pad", 5),
  ("b1", "lamp", 30),
  ("b2", "desk", 120),
  ("c1", "mug", 8)
AS UNUSED_TABLE_NAME(sku, name, price)),
t_2_Color AS (SELECT * FROM VALUES
  ("a1", "red"),
  ("c1", "red")
AS UNUSED_TABLE_NAME(sku, color))
SELECT
  Shop_Product.name AS name,
  t_0_Color.color AS color
FROM
  t_1_Shop_Product AS Shop_Product, t_2_Color AS t_0_Color
WHERE
  (t_0_Color.sku = Shop_Product.sku) ORDER BY name NULLS LAST, color NULLS LAST;
