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
   UNION ALL
  
    SELECT
      'Q3' AS col0,
      'North' AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      'Q3' AS col0,
      'South' AS col1,
      160 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY 1;

-- Interacting with table logica_test.QuarterTotals

SELECT
  QuarterTotals.col0 AS quarter,
  QuarterTotals.total AS total
FROM
  logica_test.QuarterTotals AS QuarterTotals ORDER BY quarter;