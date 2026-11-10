-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      5 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      6 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_G AS (SELECT
  V.g AS g
FROM
  t_2_V AS V
GROUP BY 1),
t_3_Big AS (SELECT
  t_4_V.g AS g
FROM
  t_2_V AS t_4_V
WHERE
  (t_4_V.x > 4)
GROUP BY 1)
SELECT
  t_0_G.g AS g
FROM
  t_1_G AS t_0_G
WHERE
  NOT (t_0_G.g IS NOT NULL AND CAST(t_0_G.g AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Big.g AS synalog_k0
  FROM
    t_3_Big AS Big
  GROUP BY 1) AS synalog_m));