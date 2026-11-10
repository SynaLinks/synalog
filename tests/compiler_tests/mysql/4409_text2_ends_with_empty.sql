-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'Hello' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      ' a ' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      'aaa' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      'hello world' AS s
   UNION ALL
  
    SELECT
      7 AS k,
      'naïve' AS s
   UNION ALL
  
    SELECT
      8 AS k,
      'lol' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  W.k AS k,
  (CHAR_LENGTH('') <= CHAR_LENGTH(W.s) AND SUBSTR(W.s, CHAR_LENGTH(W.s) - CHAR_LENGTH('') + 1, CHAR_LENGTH('')) = '') AS v
FROM
  t_0_W AS W
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;