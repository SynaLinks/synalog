-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'A' AS product,
      100 AS amount
   UNION ALL
  
    SELECT
      'A' AS product,
      150 AS amount
   UNION ALL
  
    SELECT
      'B' AS product,
      200 AS amount
   UNION ALL
  
    SELECT
      'C' AS product,
      50 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_1_AvgSale AS (SELECT
  SUM(t_2_Sales.amount) AS synalog_value
FROM
  t_0_Sales AS t_2_Sales),
t_3_CountSales AS (SELECT
  SUM(1) AS synalog_value
FROM
  t_0_Sales AS t_4_Sales)
SELECT * FROM (
SELECT
  Sales.product AS product,
  Sales.amount AS amount
FROM
  t_0_Sales AS Sales, t_1_AvgSale AS AvgSale, t_3_CountSales AS CountSales
WHERE
  (Sales.amount > (CAST(AvgSale.synalog_value AS DOUBLE) / NULLIF(CountSales.synalog_value, 0)))
) AS UNUSED_TABLE_NAME ORDER BY product IS NULL, product;