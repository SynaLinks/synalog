-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'East' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'East' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'East' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      1 AS col0,
      'West' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'West' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'West' AS col1,
      220 AS col2
  
) AS UNUSED_TABLE_NAME  ),
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
  t_0_RegionalTotal AS RegionalTotal ORDER BY region;