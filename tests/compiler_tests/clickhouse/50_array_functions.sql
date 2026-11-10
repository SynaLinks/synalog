-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Lists AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      [1, 2] AS a,
      [3, 4] AS b
   UNION ALL
  
    SELECT
      2 AS id,
      [5] AS a,
      [6, 7, 8] AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Concatenated AS (SELECT
  Lists.id AS id,
  length(arrayConcat(Lists.a, Lists.b)) AS total_size,
  (CASE WHEN 0 < 0 OR 0 >= length(arrayConcat(Lists.a, Lists.b)) THEN NULL ELSE arrayElement(arrayConcat(Lists.a, Lists.b), toInt64(0) + 1) END) AS head
FROM
  t_1_Lists AS Lists ORDER BY id)
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated ORDER BY id;