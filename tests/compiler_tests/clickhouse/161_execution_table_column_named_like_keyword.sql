-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS "order",
      'paid' AS "select"
   UNION ALL
  
    SELECT
      11 AS "order",
      'open' AS "select"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Line."order" AS "order"
FROM
  t_0_Line AS Line
WHERE
  (Line."select" = 'paid');