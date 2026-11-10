-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH RECURSIVE t_0_W_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        'a' AS w,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        (CONCAT('a', 'a')) AS w,
        ((0) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (CHAR_LENGTH('a') < 3) AND
        (0 < 5) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        (CONCAT((CONCAT('a', 'a')), 'a')) AS w,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (CHAR_LENGTH((CONCAT('a', 'a'))) < 3) AND
        (((0) + (1)) < 5) AND
        (CHAR_LENGTH('a') < 3) AND
        (0 < 5) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        (CONCAT((CONCAT((CONCAT('a', 'a')), 'a')), 'a')) AS w,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (CHAR_LENGTH((CONCAT((CONCAT('a', 'a')), 'a'))) < 3) AND
        (((((0) + (1))) + (1)) < 5) AND
        (CHAR_LENGTH((CONCAT('a', 'a'))) < 3) AND
        (((0) + (1)) < 5) AND
        (CHAR_LENGTH('a') < 3) AND
        (0 < 5) AND
        (1 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  (CONCAT(t_9_W_RecursiveCte.w, 'a')) AS w,
  ((t_9_W_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_W_RecursiveCte AS t_9_W_RecursiveCte
WHERE
  (CHAR_LENGTH(t_9_W_RecursiveCte.w) < 3) AND
  (t_9_W_RecursiveCte.synalog_step < 5))
SELECT * FROM (
SELECT
  W_RecursiveCte.w AS w
FROM
  t_0_W_RecursiveCte AS W_RecursiveCte
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY w IS NULL, w;