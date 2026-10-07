WITH t_1_Sales AS (SELECT * FROM VALUES
  (1, "East", 100),
  (2, "East", 150),
  (3, "East", 120),
  (1, "West", 200),
  (2, "West", 180),
  (3, "West", 220)
AS UNUSED_TABLE_NAME(col0, col1, col2)),
t_0_RegionalTotal AS (SELECT
  Sales.col1 AS region,
  SUM(Sales.col2) AS total
FROM
  t_1_Sales AS Sales
GROUP BY 1)
SELECT
  RegionalTotal.region AS region,
  RegionalTotal.total AS total
FROM
  t_0_RegionalTotal AS RegionalTotal ORDER BY region NULLS LAST;