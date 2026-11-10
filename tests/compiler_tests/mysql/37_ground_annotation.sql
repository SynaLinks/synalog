-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;
CREATE DATABASE IF NOT EXISTS synalog_test DEFAULT COLLATE utf8mb4_0900_bin;

DROP TABLE IF EXISTS synalog_test.QuarterTotals;
CREATE TABLE synalog_test.QuarterTotals AS WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'Q1' AS col0,
      'North' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Q1' AS col0,
      'South' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'North' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'South' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'Q3' AS col0,
      'North' AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      'Q3' AS col0,
      'South' AS col1,
      160 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY 1;

-- Interacting with table synalog_test.QuarterTotals

SELECT * FROM (
SELECT
  QuarterTotals.col0 AS quarter,
  QuarterTotals.total AS total
FROM
  synalog_test.QuarterTotals AS QuarterTotals
) AS UNUSED_TABLE_NAME ORDER BY quarter IS NULL, quarter;