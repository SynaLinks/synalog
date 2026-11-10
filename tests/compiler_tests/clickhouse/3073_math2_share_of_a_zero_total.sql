-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_3_T AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      0 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_M AS (SELECT
  t_2_T.g AS g,
  MIN(t_2_T.x) AS m
FROM
  t_3_T AS t_2_T
GROUP BY 1),
t_4_S AS (SELECT
  t_5_T.g AS g,
  SUM(t_5_T.x) AS t
FROM
  t_3_T AS t_5_T
GROUP BY 1)
SELECT
  t_0_M.g AS g,
  (t_0_M.m / NULLIF(S.t, 0)) AS share
FROM
  t_1_M AS t_0_M, t_4_S AS S
WHERE
  (S.g = t_0_M.g) ORDER BY g;