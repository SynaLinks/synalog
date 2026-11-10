-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'N' AS region,
      10 AS amount
   UNION ALL
  
    SELECT
      'N' AS region,
      20 AS amount
   UNION ALL
  
    SELECT
      'S' AS region,
      30 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  SUM(Sales.amount) AS synalog_value
FROM
  t_0_Sales AS Sales) AS total ORDER BY total;