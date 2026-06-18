ATTACH DATABASE ':memory:' AS logica_test;

DROP TABLE IF EXISTS logica_test.QuarterTotals;
CREATE TABLE logica_test.QuarterTotals AS WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'Q1' AS col0,
      'North' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Q1' AS col0,
      'South' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'North' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'South' AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY Sales.col0;

-- Interacting with table logica_test.QuarterTotals

DROP TABLE IF EXISTS logica_test.RegionTotals;
CREATE TABLE logica_test.RegionTotals AS WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'Q1' AS col0,
      'North' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Q1' AS col0,
      'South' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'North' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'South' AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col1 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY Sales.col1;

-- Interacting with table logica_test.RegionTotals

WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'Q1' AS col0,
      'North' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Q1' AS col0,
      'South' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'North' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'South' AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS quarter,
  Sales.col1 AS region,
  QuarterTotals.total AS qtotal,
  RegionTotals.total AS rtotal
FROM
  t_0_Sales AS Sales, logica_test.QuarterTotals AS QuarterTotals, logica_test.RegionTotals AS RegionTotals
WHERE
  (QuarterTotals.col0 = Sales.col0) AND
  (RegionTotals.col0 = Sales.col1) ORDER BY quarter, region;