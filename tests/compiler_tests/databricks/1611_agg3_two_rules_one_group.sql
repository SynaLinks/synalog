WITH t_1_Sale AS (SELECT * FROM VALUES
  (1, "north", "tea", 4, 30),
  (2, "north", "coffee", 2, 50),
  (3, "south", "tea", 6, 30),
  (4, "south", "cake", 1, 80),
  (5, "east", "coffee", 5, 50),
  (6, "east", "tea", 2, 30),
  (7, "north", "cake", 3, 80),
  (8, "west", "coffee", 4, 50),
  (9, "south", "coffee", 3, 50),
  (10, "east", "cake", 3, 80)
AS UNUSED_TABLE_NAME(id, region, item, qty, price)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Sale.item AS item,
      Sale.qty AS units
    FROM
      t_1_Sale AS Sale
   UNION ALL
  
    SELECT
      "tea" AS item,
      10 AS units
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.item AS item,
  SUM(Q_MultBodyAggAux.units) AS units
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY item NULLS LAST, units NULLS LAST;
