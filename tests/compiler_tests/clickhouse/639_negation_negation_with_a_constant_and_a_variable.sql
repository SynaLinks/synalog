-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x
FROM
  t_0_V AS V
WHERE
  NOT (V.g IS NOT NULL AND V.x IS NOT NULL AND (CAST(V.g AS Nullable(String)), CAST(V.x AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    'a' AS synalog_k0,
    1 AS synalog_k1
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  GROUP BY 1, 2) AS synalog_m));