-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH RECURSIVE t_1_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        2 AS x,
        ((0) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (0 < 5) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (1 = 2)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (1 = 2)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  2 AS x,
  ((t_15_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_R_RecursiveCte AS t_15_R_RecursiveCte
WHERE
  (t_15_R_RecursiveCte.synalog_step < 5) AND
  (t_15_R_RecursiveCte.x = 1)),
t_0_R AS (SELECT
  R_RecursiveCte.x AS x
FROM
  t_1_R_RecursiveCte AS R_RecursiveCte
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2, 3, 4) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_2
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_0_R AS R
  WHERE
    (R.x = JSON_VALUE(x_2.value, '$' RETURNING DOUBLE))) IS NULL);