WITH t_1_Sales AS (SELECT * FROM VALUES
  ("North", "A", 100),
  ("North", "B", 150),
  ("South", "A", 200),
  ("South", "B", 75),
  ("East", "A", 300)
AS UNUSED_TABLE_NAME(region, product, amount)),
t_0_RegionStats AS (SELECT
  Sales.region AS region,
  SUM(Sales.amount) AS total,
  SUM(1) AS count,
  MAX(Sales.amount) AS max_sale,
  MIN(Sales.amount) AS min_sale
FROM
  t_1_Sales AS Sales
GROUP BY 1 ORDER BY region NULLS LAST)
SELECT
  RegionStats.region AS region,
  RegionStats.total AS total,
  RegionStats.count AS count,
  RegionStats.max_sale AS max_sale,
  RegionStats.min_sale AS min_sale
FROM
  t_0_RegionStats AS RegionStats ORDER BY region NULLS LAST;