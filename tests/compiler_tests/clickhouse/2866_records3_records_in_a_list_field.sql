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
      CAST(tuple([CAST(tuple('p') AS Tuple(n Nullable(String))), CAST(tuple('q') AS Tuple(n Nullable(String)))], 'a') AS Tuple(items Array(Tuple(n Nullable(String))), name Nullable(String))) AS r
   UNION ALL
  
    SELECT
      CAST(tuple([CAST(tuple('r') AS Tuple(n Nullable(String)))], 'b') AS Tuple(items Array(Tuple(n Nullable(String))), name Nullable(String))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  tupleElement(T.r, 'name') AS name,
  tupleElement(x_1, 'n') AS item
FROM
  t_0_T AS T
  ARRAY JOIN tupleElement(T.r, 'items') AS x_1 ORDER BY name, item;