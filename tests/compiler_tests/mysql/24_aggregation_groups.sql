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
      'North' AS col0,
      'A' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'B' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'A' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'A' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'B' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'C' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'A' AS col1,
      300 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_TotalByRegion AS (SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_1_Sales AS Sales
GROUP BY 1)
SELECT * FROM (
SELECT
  TotalByRegion.col0 AS region,
  TotalByRegion.total AS total
FROM
  t_0_TotalByRegion AS TotalByRegion
) AS UNUSED_TABLE_NAME ORDER BY region IS NULL, region;