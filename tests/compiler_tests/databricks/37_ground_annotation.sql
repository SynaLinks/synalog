DROP TABLE IF EXISTS synalog_home.QuarterTotals;
CREATE TABLE synalog_home.QuarterTotals AS WITH t_0_Sales AS (SELECT * FROM VALUES
  ("Q1", "North", 100),
  ("Q1", "South", 150),
  ("Q2", "North", 120),
  ("Q2", "South", 180),
  ("Q3", "North", 110),
  ("Q3", "South", 160)
AS UNUSED_TABLE_NAME(col0, col1, col2))
SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY 1;

-- Interacting with table synalog_home.QuarterTotals

SELECT
  QuarterTotals.col0 AS quarter,
  QuarterTotals.total AS total
FROM
  synalog_home.QuarterTotals AS QuarterTotals ORDER BY quarter NULLS LAST;