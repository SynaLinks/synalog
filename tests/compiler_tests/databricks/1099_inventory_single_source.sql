WITH t_2_Stock AS (SELECT * FROM VALUES
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
t_1_N AS (SELECT
  Stock.item AS item,
  SUM(1) AS n
FROM
  t_2_Stock AS Stock
GROUP BY 1)
SELECT
  t_0_N.item AS item
FROM
  t_1_N AS t_0_N
WHERE
  (t_0_N.n = 1);
