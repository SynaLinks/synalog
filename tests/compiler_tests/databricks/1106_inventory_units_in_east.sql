WITH t_0_Stock AS (SELECT * FROM VALUES
  ("north", "bolt", 120),
  ("north", "nut", 40),
  ("north", "gear", 5),
  ("south", "bolt", 30),
  ("south", "gear", 12),
  ("south", "belt", 7),
  ("east", "nut", 15),
  ("east", "belt", 2),
  ("east", "chain", 9)
AS UNUSED_TABLE_NAME(warehouse, item, qty))
SELECT
  SUM(Stock.qty) AS n
FROM
  t_0_Stock AS Stock
WHERE
  (Stock.warehouse = "east");
