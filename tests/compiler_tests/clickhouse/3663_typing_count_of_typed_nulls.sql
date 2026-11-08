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
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      7 AS v
   UNION ALL
  
    SELECT
      3 AS k,
      null AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(CASE WHEN (t_0_V.v IS null) THEN 1 ELSE 0 END) AS n
FROM
  t_1_V AS t_0_V;