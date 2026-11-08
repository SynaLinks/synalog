-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Want AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Want.a AS a,
  Want.b AS b
FROM
  t_0_Want AS Want
WHERE
  NOT (Want.a IS NOT NULL AND Want.b IS NOT NULL AND (CAST(Want.a AS Nullable(String)), CAST(Want.b AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    1 AS synalog_k0,
    3 AS synalog_k1
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  GROUP BY 1, 2) AS synalog_m));