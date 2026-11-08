-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_8_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'b' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'c' AS n
   UNION ALL
  
    SELECT
      2 AS k,
      'a' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(V.k, CAST(tuple(V.n) AS Tuple(n Nullable(String))))))) AS l
FROM
  t_8_V AS V),
t_0_J AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(x_12, tupleElement((CASE WHEN x_12 < 0 OR x_12 >= length(t_4_L.l) THEN NULL ELSE arrayElement(t_4_L.l, toInt64(x_12) + 1) END), 'n'))))) AS s
FROM
  t_5_L AS t_4_L
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(length(t_4_L.l), 0)))) AS x_12)
SELECT
  arrayStringConcat(J.s, '-') AS s
FROM
  t_0_J AS J;