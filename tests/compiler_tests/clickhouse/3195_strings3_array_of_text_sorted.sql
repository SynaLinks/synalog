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
      'b' AS w
   UNION ALL
  
    SELECT
      'a' AS w
   UNION ALL
  
    SELECT
      'B' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(V.w, V.w)))) AS l
FROM
  t_4_V AS V)
SELECT
  arrayStringConcat(t_0_L.l, ',') AS s
FROM
  t_1_L AS t_0_L;