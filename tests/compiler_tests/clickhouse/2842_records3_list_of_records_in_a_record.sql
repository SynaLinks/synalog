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
      CAST(tuple('a', [CAST(tuple(1) AS Tuple(v Nullable(Float64))), CAST(tuple(2) AS Tuple(v Nullable(Float64)))]) AS Tuple(name Nullable(String), xs Array(Tuple(v Nullable(Float64))))) AS r
   UNION ALL
  
    SELECT
      CAST(tuple('b', [CAST(tuple(5) AS Tuple(v Nullable(Float64)))]) AS Tuple(name Nullable(String), xs Array(Tuple(v Nullable(Float64))))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  tupleElement(t_0_R.r, 'name') AS name,
  tupleElement(x_1, 'v') AS v
FROM
  t_1_R AS t_0_R
  ARRAY JOIN tupleElement(t_0_R.r, 'xs') AS x_1 ORDER BY name, v;