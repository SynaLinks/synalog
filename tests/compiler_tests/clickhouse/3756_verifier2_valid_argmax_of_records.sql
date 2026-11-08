-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_4_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT
  argMax(CAST(tuple(t_2_N.n, t_2_N.s) AS Tuple(n Nullable(Float64), s Nullable(String))), t_2_N.n) AS best
FROM
  t_4_N AS t_2_N)
SELECT
  tupleElement(t_0_A.best, 's') AS s
FROM
  t_1_A AS t_0_A;