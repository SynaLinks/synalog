-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Events1 AS (SELECT * FROM (
  
    SELECT
      'A' AS category,
      10 AS count
   UNION ALL
  
    SELECT
      'A' AS category,
      20 AS count
   UNION ALL
  
    SELECT
      'B' AS category,
      15 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total1 AS (SELECT
  Events1.category AS category,
  SUM(Events1.count) AS total
FROM
  t_1_Events1 AS Events1
GROUP BY 1),
t_1_Events2 AS (SELECT * FROM (
  
    SELECT
      'B' AS category,
      5 AS count
   UNION ALL
  
    SELECT
      'C' AS category,
      25 AS count
   UNION ALL
  
    SELECT
      'C' AS category,
      30 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total2 AS (SELECT
  Events2.category AS category,
  SUM(Events2.count) AS total
FROM
  t_1_Events2 AS Events2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      'events1' AS source,
      Total1.category AS category,
      Total1.total AS total
    FROM
      t_0_Total1 AS Total1
   UNION ALL
  
    SELECT
      'events2' AS source,
      Total2.category AS category,
      Total2.total AS total
    FROM
      t_0_Total2 AS Total2
  
) AS UNUSED_TABLE_NAME  ORDER BY source IS NULL, source, category IS NULL, category ;