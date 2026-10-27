DROP TABLE IF EXISTS synalog_test.QuarterTotals;
CREATE TABLE synalog_test.QuarterTotals AS WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      "Q1" AS col0,
      "North" AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      "Q1" AS col0,
      "South" AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      "Q2" AS col0,
      "North" AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      "Q2" AS col0,
      "South" AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY col0;

-- Interacting with table synalog_test.QuarterTotals

DROP TABLE IF EXISTS synalog_test.RegionTotals;
CREATE TABLE synalog_test.RegionTotals AS WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      "Q1" AS col0,
      "North" AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      "Q1" AS col0,
      "South" AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      "Q2" AS col0,
      "North" AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      "Q2" AS col0,
      "South" AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col1 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY col0;

-- Interacting with table synalog_test.RegionTotals

WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      "Q1" AS col0,
      "North" AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      "Q1" AS col0,
      "South" AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      "Q2" AS col0,
      "North" AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      "Q2" AS col0,
      "South" AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS quarter,
  Sales.col1 AS region,
  QuarterTotals.total AS qtotal,
  RegionTotals.total AS rtotal
FROM
  t_0_Sales AS Sales, synalog_test.QuarterTotals AS QuarterTotals, synalog_test.RegionTotals AS RegionTotals
WHERE
  (QuarterTotals.col0 IS NOT DISTINCT FROM Sales.col0) AND
  (RegionTotals.col0 IS NOT DISTINCT FROM Sales.col1) ORDER BY quarter NULLS LAST, region NULLS LAST;