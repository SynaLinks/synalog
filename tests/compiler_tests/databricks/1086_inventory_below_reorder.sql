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
AS UNUSED_TABLE_NAME(item, level))
SELECT
  Total.item AS item
FROM
  t_0_Total AS Total, t_2_Reorder AS Reorder
WHERE
  (Total.n < Reorder.level) AND
  (Reorder.item = Total.item) ORDER BY item NULLS LAST;
