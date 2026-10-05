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
t_1_In AS (SELECT
  Stock.warehouse AS warehouse,
  Stock.item AS item
FROM
  t_2_Stock AS Stock
GROUP BY 1, 2)
SELECT
  t_0_In.item AS item
FROM
  t_1_In AS t_0_In
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_In AS t_3_In
  WHERE
    (t_3_In.warehouse = "south") AND
    (t_3_In.item = t_0_In.item)) IS NULL) AND
  (t_0_In.warehouse = "east") ORDER BY item NULLS LAST;
