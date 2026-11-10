-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'a' AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      'b' AS g,
      null AS v
   UNION ALL
  
    SELECT
      4 AS id,
      null AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_G AS (SELECT * FROM (
  
    SELECT
      'a' AS g
   UNION ALL
  
    SELECT
      'b' AS g
   UNION ALL
  
    SELECT
      'c' AS g
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_G.g AS g,
  COALESCE((SELECT
  SUM(1) AS synalog_value
FROM
  t_1_E AS E
WHERE
  (E.g = t_0_G.g)), 0) AS n
FROM
  t_2_G AS t_0_G
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;