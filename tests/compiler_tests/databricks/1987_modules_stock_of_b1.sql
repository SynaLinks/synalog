WITH t_0_Shop_Stock AS (SELECT * FROM VALUES
  ("a1", 100),
  ("a2", 40),
  ("b1", 3),
  ("c1", 0)
AS UNUSED_TABLE_NAME(sku, qty))
SELECT
  Shop_Stock.qty AS qty
FROM
  t_0_Shop_Stock AS Shop_Stock
WHERE
  (Shop_Stock.sku = "b1");
