-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.a AS a,
  P.b AS b
FROM
  t_0_P AS P
WHERE
  NOT (P.a IS NOT NULL AND P.b IS NOT NULL AND (CAST(P.a AS Nullable(String)), CAST(P.b AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    1 AS synalog_k0,
    1 AS synalog_k1
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  GROUP BY 1, 2) AS synalog_m));