-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      1 AS u
   UNION ALL
  
    SELECT
      2 AS u
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_U.u AS u,
  (SELECT
  MIN(false) AS synalog_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (t_0_U.u = 1)) AS l
FROM
  t_1_U AS t_0_U ORDER BY u;