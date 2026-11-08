-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2024-01-15 10:30:00' AS created_at
   UNION ALL
  
    SELECT
      2 AS id,
      '2024-01-20 14:00:00' AS created_at
   UNION ALL
  
    SELECT
      3 AS id,
      '2024-02-05 09:15:00' AS created_at
  
) AS UNUSED_TABLE_NAME  ),
t_0_MonthlyCount AS (SELECT
  substringUTF8(CAST(Orders.created_at AS Nullable(String)), 1, 7) AS month,
  SUM(1) AS count
FROM
  t_1_Orders AS Orders
GROUP BY 1 ORDER BY month)
SELECT
  MonthlyCount.month AS month,
  MonthlyCount.count AS count
FROM
  t_0_MonthlyCount AS MonthlyCount ORDER BY month;