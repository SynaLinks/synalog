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
      4 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_G AS (SELECT
  t_3_V.g AS g
FROM
  t_1_V AS t_3_V
GROUP BY 1)
SELECT
  t_0_G.g AS g,
  (SELECT
  SUM(V.x) AS synalog_value
FROM
  t_1_V AS V
WHERE
  (V.g = t_0_G.g)) AS t
FROM
  t_2_G AS t_0_G ORDER BY g;