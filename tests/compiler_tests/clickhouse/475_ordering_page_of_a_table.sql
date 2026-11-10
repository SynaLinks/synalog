-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      'd' AS k,
      4 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'c' AS k,
      3 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      2 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  T.v AS v
FROM
  t_0_T AS T ORDER BY k;