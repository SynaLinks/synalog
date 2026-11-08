-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(tuple('x', [1]) AS Tuple(a Nullable(String), l Array(Nullable(Float64)))) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(tuple(null, CAST([] AS Array(Nullable(Float64)))) AS Tuple(a Nullable(String), l Array(Nullable(Float64)))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  tupleElement(t_0_R.r, 'a') AS a,
  length(tupleElement(t_0_R.r, 'l')) AS n
FROM
  t_1_R AS t_0_R ORDER BY k;