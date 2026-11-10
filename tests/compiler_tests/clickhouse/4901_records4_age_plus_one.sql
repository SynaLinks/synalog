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
      CAST(tuple(31, CAST(tuple('paris') AS Tuple(city Nullable(String))), 'ann', ['a', 'b']) AS Tuple(age Nullable(Float64), home Tuple(city Nullable(String)), name Nullable(String), tags Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(tuple(null, CAST(tuple('oslo') AS Tuple(city Nullable(String))), 'bob', CAST([] AS Array(Nullable(String)))) AS Tuple(age Nullable(Float64), home Tuple(city Nullable(String)), name Nullable(String), tags Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      CAST(tuple(45, CAST(tuple('paris') AS Tuple(city Nullable(String))), 'cid', ['c']) AS Tuple(age Nullable(Float64), home Tuple(city Nullable(String)), name Nullable(String), tags Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      4 AS id,
      CAST(tuple(22, CAST(tuple(null) AS Tuple(city Nullable(String))), 'dee', ['a']) AS Tuple(age Nullable(Float64), home Tuple(city Nullable(String)), name Nullable(String), tags Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      5 AS id,
      CAST(tuple(38, CAST(tuple('rome') AS Tuple(city Nullable(String))), 'eve', ['b', 'c', 'd']) AS Tuple(age Nullable(Float64), home Tuple(city Nullable(String)), name Nullable(String), tags Array(Nullable(String)))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS id,
  ((tupleElement(P.r, 'age')) + (1)) AS v
FROM
  t_0_P AS P ORDER BY id;