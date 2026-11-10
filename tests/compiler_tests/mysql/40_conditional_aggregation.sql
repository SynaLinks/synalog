-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      'Electronics' AS category,
      500 AS amount
   UNION ALL
  
    SELECT
      'Electronics' AS category,
      300 AS amount
   UNION ALL
  
    SELECT
      'Books' AS category,
      50 AS amount
   UNION ALL
  
    SELECT
      'Books' AS category,
      75 AS amount
   UNION ALL
  
    SELECT
      'Clothing' AS category,
      200 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_CategorySummary AS (SELECT * FROM (
SELECT
  Sales.category AS category,
  SUM(Sales.amount) AS total,
  SUM(CASE WHEN (Sales.amount >= 200) THEN 1 ELSE 0 END) AS high_value_count
FROM
  t_1_Sales AS Sales
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY category IS NULL, category)
SELECT * FROM (
SELECT
  CategorySummary.category AS category,
  CategorySummary.total AS total,
  CategorySummary.high_value_count AS high_value_count
FROM
  t_0_CategorySummary AS CategorySummary
) AS UNUSED_TABLE_NAME ORDER BY category IS NULL, category;