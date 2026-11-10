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
      'A' AS w
   UNION ALL
  
    SELECT
      'Z' AS w
   UNION ALL
  
    SELECT
      'n' AS w
   UNION ALL
  
    SELECT
      'z' AS w
   UNION ALL
  
    SELECT
      'm' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.w AS w
FROM
  t_0_V AS V
WHERE
  (V.w > 'm') ORDER BY w;