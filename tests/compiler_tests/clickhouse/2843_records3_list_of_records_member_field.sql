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
      [CAST(tuple('a', 1) AS Tuple(n Nullable(String), v Nullable(Float64))), CAST(tuple('b', 2) AS Tuple(n Nullable(String), v Nullable(Float64)))] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [CAST(tuple('c', 3) AS Tuple(n Nullable(String), v Nullable(Float64)))] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k
FROM
  t_0_T AS T
  ARRAY JOIN T.l AS x_3
WHERE
  (tupleElement(x_3, 'n') = 'b')
GROUP BY 1;