-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_Day AS (SELECT
  S.d AS d
FROM
  t_1_S AS S
GROUP BY 1),
t_5_Region AS (SELECT
  t_6_S.r AS r
FROM
  t_1_S AS t_6_S
GROUP BY 1),
t_2_Missing AS (SELECT
  t_3_Day.d AS d
FROM
  t_0_Day AS t_3_Day, t_5_Region AS Region
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_1_S AS t_7_S
  WHERE
    (t_7_S.r = Region.r) AND
    (t_7_S.d = t_3_Day.d)) IS NULL)
GROUP BY 1)
SELECT * FROM (
SELECT
  Day.d AS d
FROM
  t_0_Day AS Day
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_2_Missing AS Missing
  WHERE
    (Missing.d = Day.d)) IS NULL)
) AS UNUSED_TABLE_NAME ORDER BY d IS NULL, d;