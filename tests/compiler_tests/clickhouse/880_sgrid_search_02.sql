-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      'alpha' AS w
   UNION ALL
  
    SELECT
      'beta' AS w
   UNION ALL
  
    SELECT
      'gamma' AS w
   UNION ALL
  
    SELECT
      'delta' AS w
   UNION ALL
  
    SELECT
      'epsilon' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W ORDER BY w;