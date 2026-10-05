DROP TABLE IF EXISTS logica_test.QuarterTotals;
CREATE TABLE logica_test.QuarterTotals AS WITH t_0_Sales AS (SELECT * FROM VALUES
  ("Q1", "North", 100),
  ("Q1", "South", 150),
  ("Q2", "North", 120),
  ("Q2", "South", 180)
AS UNUSED_TABLE_NAME(col0, col1, col2))
SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY 1;

-- Interacting with table logica_test.QuarterTotals

DROP TABLE IF EXISTS logica_test.RegionTotals;
CREATE TABLE logica_test.RegionTotals AS WITH t_0_Sales AS (SELECT * FROM VALUES
  ("Q1", "North", 100),
  ("Q1", "South", 150),
  ("Q2", "North", 120),
  ("Q2", "South", 180)
AS UNUSED_TABLE_NAME(col0, col1, col2))
SELECT
  Sales.col1 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY 1;

-- Interacting with table logica_test.RegionTotals

WITH t_0_Sales AS (SELECT * FROM VALUES
  ("Q1", "North", 100),
  ("Q1", "South", 150),
  ("Q2", "North", 120),
  ("Q2", "South", 180)
AS UNUSED_TABLE_NAME(col0, col1, col2))
SELECT
  Sales.col0 AS quarter,
  Sales.col1 AS region,
  QuarterTotals.total AS qtotal,
  RegionTotals.total AS rtotal
FROM
  t_0_Sales AS Sales, logica_test.QuarterTotals AS QuarterTotals, logica_test.RegionTotals AS RegionTotals
WHERE
  (QuarterTotals.col0 = Sales.col0) AND
  (RegionTotals.col0 = Sales.col1) ORDER BY quarter NULLS LAST, region NULLS LAST;