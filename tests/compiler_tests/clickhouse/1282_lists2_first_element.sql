-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_L AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.id AS id,
  (CASE WHEN 0 < 0 OR 0 >= length(t_0_L.l) THEN NULL ELSE arrayElement(t_0_L.l, toInt64(0) + 1) END) AS x
FROM
  t_1_L AS t_0_L
WHERE
  (length(t_0_L.l) > 0) ORDER BY id, x;