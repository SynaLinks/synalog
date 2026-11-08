-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

SELECT * FROM (
  
    SELECT
      x_6 AS id,
      'a' AS v
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [1, 2] AS x_6
    WHERE
      (1 = x_6)
   UNION ALL
  
    SELECT
      x_3 AS id,
      'none' AS v
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [1, 2] AS x_3
    WHERE
      NOT (x_3 IS NOT NULL AND CAST(x_3 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        1 AS synalog_k0
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      GROUP BY 1) AS synalog_m))
  
) AS UNUSED_TABLE_NAME  ORDER BY id ;