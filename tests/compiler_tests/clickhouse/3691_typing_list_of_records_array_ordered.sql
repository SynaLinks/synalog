-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'a' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'b' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(V.k, CAST(tuple(V.n) AS Tuple(n Nullable(String))))))) AS l
FROM
  t_4_V AS V)
SELECT
  tupleElement((CASE WHEN 0 < 0 OR 0 >= length(t_0_L.l) THEN NULL ELSE arrayElement(t_0_L.l, toInt64(0) + 1) END), 'n') AS n
FROM
  t_1_L AS t_0_L;