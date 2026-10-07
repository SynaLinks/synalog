WITH t_0_Shop_Product AS (SELECT * FROM VALUES
  ("a1", "pen", 2),
  ("a2", "pad", 5),
  ("b1", "lamp", 30),
  ("b2", "desk", 120),
  ("c1", "mug", 8)
AS UNUSED_TABLE_NAME(sku, name, price)),
t_1_Shop_Stock AS (SELECT * FROM VALUES
  ("a1", 100),
  ("a2", 40),
  ("b1", 3),
  ("c1", 0)
AS UNUSED_TABLE_NAME(sku, qty))
SELECT
  Shop_Product.name AS name,
  Shop_Stock.qty AS qty
FROM
  t_0_Shop_Product AS Shop_Product, t_1_Shop_Stock AS Shop_Stock
WHERE
  (Shop_Stock.sku = Shop_Product.sku) ORDER BY name NULLS LAST, qty NULLS LAST;
