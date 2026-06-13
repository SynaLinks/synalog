WITH t_2_Sales AS (SELECT * FROM (
  
    SELECT
      "North" AS col0,
      "Q1" AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      "North" AS col0,
      "Q2" AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      "North" AS col0,
      "Q3" AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      "South" AS col0,
      "Q1" AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      "South" AS col0,
      "Q2" AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      "South" AS col0,
      "Q3" AS col1,
      220 AS col2
   UNION ALL
  
    SELECT
      "East" AS col0,
      "Q1" AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      "East" AS col0,
      "Q2" AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      "East" AS col0,
      "Q3" AS col1,
      95 AS col2
  
) AS UNUSED_TABLE_NAME  ),
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
  t_0_BestQuarter AS BestQuarter ORDER BY region;