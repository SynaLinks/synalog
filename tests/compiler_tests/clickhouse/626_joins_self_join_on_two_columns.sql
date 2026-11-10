-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x1,
  t_0_V.x AS x2
FROM
  t_1_V AS V, t_1_V AS t_0_V
WHERE
  (V.x < t_0_V.x) AND
  (t_0_V.g = V.g);