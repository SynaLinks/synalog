-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Friend AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'a' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS name
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN ['a', 'b', 'c'] AS x_3
WHERE
  NOT (x_3 IS NOT NULL AND CAST(x_3 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Friend.a AS synalog_k0
  FROM
    t_0_Friend AS Friend
  GROUP BY 1) AS synalog_m)) ORDER BY name;