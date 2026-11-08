-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(tuple('a', [1, 2, 3]) AS Tuple(name Nullable(String), xs Array(Nullable(Float64)))) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(tuple('b', [4]) AS Tuple(name Nullable(String), xs Array(Nullable(Float64)))) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      CAST(tuple('c', CAST([] AS Array(Nullable(Float64)))) AS Tuple(name Nullable(String), xs Array(Nullable(Float64)))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k
FROM
  t_0_S AS S
  ARRAY JOIN tupleElement(S.r, 'xs') AS x_3
WHERE
  (2 = x_3);