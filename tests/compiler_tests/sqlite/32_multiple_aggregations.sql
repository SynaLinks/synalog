WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      'North' AS region,
      'A' AS product,
      100 AS amount
   UNION ALL
  
    SELECT
      'North' AS region,
      'B' AS product,
      150 AS amount
   UNION ALL
  
    SELECT
      'South' AS region,
      'A' AS product,
      200 AS amount
   UNION ALL
  
    SELECT
      'South' AS region,
      'B' AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      'East' AS region,
      'A' AS product,
      300 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_RegionStats AS (SELECT
  Sales.region AS region,
  SUM(Sales.amount) AS total,
  SUM(1) AS count,
  MAX(Sales.amount) AS max_sale,
  MIN(Sales.amount) AS min_sale
FROM
  t_1_Sales AS Sales
GROUP BY Sales.region ORDER BY region)
SELECT
  RegionStats.region AS region,
  RegionStats.total AS total,
  RegionStats.count AS count,
  RegionStats.max_sale AS max_sale,
  RegionStats.min_sale AS min_sale
FROM
  t_0_RegionStats AS RegionStats ORDER BY region;