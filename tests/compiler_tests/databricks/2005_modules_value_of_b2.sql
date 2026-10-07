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
  ((Shop_Product.price) * (Shop_Stock.qty)) AS value
FROM
  t_0_Shop_Product AS Shop_Product, t_1_Shop_Stock AS Shop_Stock
WHERE
  (Shop_Stock.sku = Shop_Product.sku) AND
  ("b2" = Shop_Product.sku);
