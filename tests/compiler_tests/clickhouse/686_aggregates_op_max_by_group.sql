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
      x_4 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [4, 1, 7, 1] AS x_4
   UNION ALL
  
    SELECT
      'b' AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  MAX(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY 1 ORDER BY g;