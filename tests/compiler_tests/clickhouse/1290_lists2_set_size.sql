-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_3_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      [3, 1, 2] AS l
   UNION ALL
  
    SELECT
      2 AS id,
      CAST([] AS Array(Nullable(Float64))) AS l
   UNION ALL
  
    SELECT
      3 AS id,
      [5] AS l
   UNION ALL
  
    SELECT
      4 AS id,
      [7, 7, 8, 9] AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT
  arraySort(groupUniqArray(x_2)) AS xs
FROM
  t_3_L AS t_2_L
  ARRAY JOIN t_2_L.l AS x_2)
SELECT
  length(t_0_All.xs) AS n
FROM
  t_1_All AS t_0_All;