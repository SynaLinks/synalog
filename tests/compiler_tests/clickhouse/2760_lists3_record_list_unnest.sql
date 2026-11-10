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
      1 AS id,
      CAST(tuple('a', ['x', 'y']) AS Tuple(name Nullable(String), tags Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(tuple('b', CAST([] AS Array(Nullable(String)))) AS Tuple(name Nullable(String), tags Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      CAST(tuple('c', ['y']) AS Tuple(name Nullable(String), tags Array(Nullable(String)))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  x_4 AS t
FROM
  t_1_R AS t_0_R
  ARRAY JOIN tupleElement(t_0_R.r, 'tags') AS x_4 ORDER BY id, t;