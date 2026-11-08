-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y,
      1 AS id
   UNION ALL
  
    SELECT
      1 AS x,
      3 AS y,
      2 AS id
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.id AS id
FROM
  t_0_A AS A
WHERE
  NOT (A.x IS NOT NULL AND A.y IS NOT NULL AND (CAST(A.x AS Nullable(String)), CAST(A.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    1 AS synalog_k0,
    2 AS synalog_k1
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  GROUP BY 1, 2) AS synalog_m));