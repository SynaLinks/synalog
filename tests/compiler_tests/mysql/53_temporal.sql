-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

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
t_0_MonthlyCount AS (SELECT * FROM (
SELECT
  SUBSTR(CAST(Orders.created_at AS CHAR), 1, 7) AS month,
  SUM(1) AS count
FROM
  t_1_Orders AS Orders
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY month IS NULL, month)
SELECT * FROM (
SELECT
  MonthlyCount.month AS month,
  MonthlyCount.count AS count
FROM
  t_0_MonthlyCount AS MonthlyCount
) AS UNUSED_TABLE_NAME ORDER BY month IS NULL, month;