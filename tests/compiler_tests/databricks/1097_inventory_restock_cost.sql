WITH t_1_Stock AS (SELECT * FROM VALUES
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
t_0_Total AS (SELECT
  Stock.item AS item,
  SUM(Stock.qty) AS n
FROM
  t_1_Stock AS Stock
GROUP BY 1),
t_2_Reorder AS (SELECT * FROM VALUES
  ("bolt", 100),
  ("nut", 60),
  ("gear", 10),
  ("belt", 10),
  ("chain", 5)
AS UNUSED_TABLE_NAME(item, level)),
t_3_Price AS (SELECT * FROM VALUES
  ("bolt", 2),
  ("nut", 1),
  ("gear", 25),
  ("belt", 14),
  ("chain", 30)
AS UNUSED_TABLE_NAME(item, cents))
SELECT
  SUM(((((Reorder.level) - (Total.n))) * (Price.cents))) AS c
FROM
  t_0_Total AS Total, t_2_Reorder AS Reorder, t_3_Price AS Price
WHERE
  (Total.n < Reorder.level) AND
  (Reorder.item = Total.item) AND
  (Price.item = Total.item);
