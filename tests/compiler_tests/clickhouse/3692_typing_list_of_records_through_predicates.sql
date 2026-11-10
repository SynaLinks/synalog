-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS v
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  arrayMap(t -> t.1, groupArray(tuple(CAST(tuple(t_2_V.n, t_2_V.v) AS Tuple(n Nullable(String), v Nullable(Float64)))))) AS l
FROM
  t_3_V AS t_2_V)
SELECT
  tupleElement(x_1, 'n') AS n,
  tupleElement(x_1, 'v') AS v
FROM
  t_1_L AS t_0_L
  ARRAY JOIN t_0_L.l AS x_1 ORDER BY n;