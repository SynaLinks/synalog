-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_3_N AS (SELECT * FROM (
  
    SELECT
      1 AS n
   UNION ALL
  
    SELECT
      2 AS n
   UNION ALL
  
    SELECT
      3 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS k
FROM
  t_3_N AS t_0_N, t_3_N AS t_1_N, t_3_N AS t_2_N
WHERE
  (((t_0_N.n) + (t_1_N.n)) = t_2_N.n);