-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      null AS k,
      0 AS a
   UNION ALL
  
    SELECT
      1 AS k,
      1 AS a
  
) AS UNUSED_TABLE_NAME  ),
t_3_B AS (SELECT * FROM (
  
    SELECT
      null AS k,
      0 AS b
   UNION ALL
  
    SELECT
      1 AS k,
      1 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_A.a AS a
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (t_1_B.k = t_0_A.k);