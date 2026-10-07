WITH t_2_Sales AS (SELECT * FROM VALUES
  ("North", "Q1", 100),
  ("North", "Q2", 150),
  ("North", "Q3", 120),
  ("South", "Q1", 200),
  ("South", "Q2", 180),
  ("South", "Q3", 220),
  ("East", "Q1", 90),
  ("East", "Q2", 110),
  ("East", "Q3", 95)
AS UNUSED_TABLE_NAME(col0, col1, col2)),
t_0_BestQuarter AS (SELECT
  Sales.col0 AS col0,
  SORT_ARRAY(COLLECT_LIST(STRUCT(Sales.col2 AS value, Sales.col1 AS arg)), false)[0].arg AS best_quarter
FROM
  t_2_Sales AS Sales
GROUP BY 1)
SELECT
  BestQuarter.col0 AS region,
  BestQuarter.best_quarter AS best_quarter
FROM
  t_0_BestQuarter AS BestQuarter ORDER BY region NULLS LAST;