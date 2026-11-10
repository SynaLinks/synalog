-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Events1 AS (SELECT * FROM (
  
    SELECT
      'A' AS category,
      10 AS count
   UNION ALL
  
    SELECT
      'A' AS category,
      20 AS count
   UNION ALL
  
    SELECT
      'B' AS category,
      15 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total1 AS (SELECT
  Events1.category AS category,
  SUM(Events1.count) AS total
FROM
  t_1_Events1 AS Events1
GROUP BY 1),
t_1_Events2 AS (SELECT * FROM (
  
    SELECT
      'B' AS category,
      5 AS count
   UNION ALL
  
    SELECT
      'C' AS category,
      25 AS count
   UNION ALL
  
    SELECT
      'C' AS category,
      30 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total2 AS (SELECT
  Events2.category AS category,
  SUM(Events2.count) AS total
FROM
  t_1_Events2 AS Events2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      'events1' AS source,
      Total1.category AS category,
      Total1.total AS total
    FROM
      t_0_Total1 AS Total1
   UNION ALL
  
    SELECT
      'events2' AS source,
      Total2.category AS category,
      Total2.total AS total
    FROM
      t_0_Total2 AS Total2
  
) AS UNUSED_TABLE_NAME  ORDER BY source, category ;