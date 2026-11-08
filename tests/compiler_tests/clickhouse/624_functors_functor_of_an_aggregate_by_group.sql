-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_In1 AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      3 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_T1 AS (SELECT
  In1.g AS g,
  SUM(In1.v) AS t
FROM
  t_1_In1 AS In1
GROUP BY 1)
SELECT
  T1.g AS g,
  T1.t AS t
FROM
  t_0_T1 AS T1 ORDER BY g;