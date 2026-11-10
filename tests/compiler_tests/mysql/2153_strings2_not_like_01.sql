-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      'a_c' AS w
   UNION ALL
  
    SELECT
      'abc' AS w
   UNION ALL
  
    SELECT
      '50%' AS w
   UNION ALL
  
    SELECT
      '500' AS w
   UNION ALL
  
    SELECT
      'x\y' AS w
   UNION ALL
  
    SELECT
      '' AS w
   UNION ALL
  
    SELECT
      'Ab' AS w
   UNION ALL
  
    SELECT
      'a%c' AS w
   UNION ALL
  
    SELECT
      'aXc' AS w
   UNION ALL
  
    SELECT
      'ac' AS w
   UNION ALL
  
    SELECT
      'hello world' AS w
   UNION ALL
  
    SELECT
      '_x' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W
WHERE
  ((t_0_W.w LIKE 'a_c' ESCAPE '\') = false)
) AS UNUSED_TABLE_NAME ORDER BY w IS NULL, w;