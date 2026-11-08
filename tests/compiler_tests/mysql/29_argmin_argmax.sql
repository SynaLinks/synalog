-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_Sales AS (SELECT * FROM (
  
    SELECT
      'North' AS col0,
      'Q1' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q2' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q3' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q1' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q2' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q3' AS col1,
      220 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q1' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q2' AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q3' AS col1,
      95 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_BestQuarter AS (SELECT
  Sales.col0 AS col0,
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(Sales.col1), '$[0]') ORDER BY Sales.col2 DESC SEPARATOR ','), ']') AS JSON), '$[0]') AS best_quarter
FROM
  t_2_Sales AS Sales
GROUP BY 1)
SELECT * FROM (
SELECT
  BestQuarter.col0 AS region,
  BestQuarter.best_quarter AS best_quarter
FROM
  t_0_BestQuarter AS BestQuarter
) AS UNUSED_TABLE_NAME ORDER BY region IS NULL, region;