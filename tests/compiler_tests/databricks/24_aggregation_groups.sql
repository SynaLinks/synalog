WITH t_1_Sales AS (SELECT * FROM VALUES
  ("North", "A", 100),
  ("North", "B", 150),
  ("North", "A", 200),
  ("South", "A", 120),
  ("South", "B", 180),
  ("South", "C", 90),
  ("East", "A", 300)
AS UNUSED_TABLE_NAME(col0, col1, col2)),
t_0_TotalByRegion AS (SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_1_Sales AS Sales
GROUP BY 1)
SELECT
  TotalByRegion.col0 AS region,
  TotalByRegion.total AS total
FROM
  t_0_TotalByRegion AS TotalByRegion ORDER BY region NULLS LAST;