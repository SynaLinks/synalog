-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_B AS (SELECT * FROM (
  
    SELECT
      'x' AS k,
      10 AS b
   UNION ALL
  
    SELECT
      'X' AS k,
      20 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS a,
  t_1_B.b AS b
FROM
  t_2_B AS t_1_B
WHERE
  (t_1_B.k = 'x');