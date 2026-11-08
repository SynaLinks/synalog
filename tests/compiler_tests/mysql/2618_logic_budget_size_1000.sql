-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Proj AS (SELECT * FROM (
  
    SELECT
      10 AS pid,
      'red' AS team,
      300 AS budget
   UNION ALL
  
    SELECT
      11 AS pid,
      'red' AS team,
      1200 AS budget
   UNION ALL
  
    SELECT
      12 AS pid,
      'blue' AS team,
      800 AS budget
   UNION ALL
  
    SELECT
      13 AS pid,
      'green' AS team,
      50 AS budget
   UNION ALL
  
    SELECT
      14 AS pid,
      'blue' AS team,
      90 AS budget
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Proj.pid AS pid,
  CASE WHEN (Proj.budget > 1000) THEN 'big' ELSE 'small' END AS size
FROM
  t_0_Proj AS Proj
) AS UNUSED_TABLE_NAME ORDER BY pid IS NULL, pid, size IS NULL, size;