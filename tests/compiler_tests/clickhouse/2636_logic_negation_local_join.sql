-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      7 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      8 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      7 AS b
   UNION ALL
  
    SELECT
      8 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2, 3] AS x_4
WHERE
  NOT (x_4 IS NOT NULL AND CAST(x_4 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    E.a AS synalog_k0
  FROM
    t_0_E AS E, t_1_L AS L
  WHERE
    (L.b = E.b)
  GROUP BY 1) AS synalog_m)) ORDER BY x;