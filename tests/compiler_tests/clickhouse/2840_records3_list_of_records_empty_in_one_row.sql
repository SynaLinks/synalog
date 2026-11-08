-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [CAST(tuple('a') AS Tuple(n Nullable(String)))] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      CAST([] AS Array(Tuple(n Nullable(String)))) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  length(T.l) AS s
FROM
  t_0_T AS T ORDER BY k;