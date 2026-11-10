-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH RECURSIVE t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      10 AS a,
      11 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        JSON_VALUE(x_7.value, '$' RETURNING DOUBLE) AS x,
        0 AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_7
     UNION ALL
    
      SELECT
        E.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_E AS E, LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_22
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (E.a = JSON_VALUE(x_22.value, '$' RETURNING DOUBLE))
     UNION ALL
    
      SELECT
        t_4_E.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_6_E, t_2_E AS t_4_E, LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_42
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_4_E.a = t_6_E.b) AND
        (t_6_E.a = JSON_VALUE(x_42.value, '$' RETURNING DOUBLE))
     UNION ALL
    
      SELECT
        t_9_E.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_13_E, t_2_E AS t_11_E, t_2_E AS t_9_E, LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_67
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_9_E.a = t_11_E.b) AND
        (t_11_E.a = t_13_E.b) AND
        (t_13_E.a = JSON_VALUE(x_67.value, '$' RETURNING DOUBLE))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_E.b AS x,
  ((t_15_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_15_R_RecursiveCte, t_2_E AS t_16_E
WHERE
  (t_15_R_RecursiveCte.synalog_step < 5) AND
  (t_16_E.a = t_15_R_RecursiveCte.x))
SELECT * FROM (
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;