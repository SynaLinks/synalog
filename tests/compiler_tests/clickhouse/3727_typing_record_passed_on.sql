-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      CAST(tuple('a', 1.5, ['x']) AS Tuple(name Nullable(String), score Nullable(Float64), tags Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(tuple('b', null, CAST([] AS Array(Nullable(String)))) AS Tuple(name Nullable(String), score Nullable(Float64), tags Array(Nullable(String)))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS id,
  tupleElement(P.r, 'name') AS name,
  length(tupleElement(P.r, 'tags')) AS n,
  tupleElement(P.r, 'score') AS s
FROM
  t_0_P AS P ORDER BY id;