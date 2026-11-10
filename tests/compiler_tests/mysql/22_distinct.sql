-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      2 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_UniqueCategories AS (SELECT * FROM (
SELECT
  Data.category AS category
FROM
  t_1_Data AS Data
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY category IS NULL, category)
SELECT * FROM (
SELECT
  UniqueCategories.category AS category
FROM
  t_0_UniqueCategories AS UniqueCategories
) AS UNUSED_TABLE_NAME ORDER BY category IS NULL, category;