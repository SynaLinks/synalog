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
AS UNUSED_TABLE_NAME(warehouse, item, qty)),
t_1_Price AS (SELECT * FROM VALUES
  ("bolt", 2),
  ("nut", 1),
  ("gear", 25),
  ("belt", 14),
  ("chain", 30)
AS UNUSED_TABLE_NAME(item, cents))
SELECT
  SUM(((Stock.qty) * (Price.cents))) AS c
FROM
  t_0_Stock AS Stock, t_1_Price AS Price
WHERE
  (Stock.warehouse = "east") AND
  (Price.item = Stock.item);
