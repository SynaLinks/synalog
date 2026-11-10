-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      10 AS pid,
      8 AS hours
   UNION ALL
  
    SELECT
      1 AS id,
      11 AS pid,
      4 AS hours
   UNION ALL
  
    SELECT
      2 AS id,
      10 AS pid,
      12 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      12 AS pid,
      20 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      14 AS pid,
      2 AS hours
   UNION ALL
  
    SELECT
      4 AS id,
      12 AS pid,
      6 AS hours
   UNION ALL
  
    SELECT
      6 AS id,
      11 AS pid,
      15 AS hours
   UNION ALL
  
    SELECT
      5 AS id,
      13 AS pid,
      1 AS hours
  
) AS UNUSED_TABLE_NAME  ),
t_0_Projects AS (SELECT
  A.id AS id,
  JSON_ARRAYAGG(A.pid) AS l
FROM
  t_1_A AS A
GROUP BY 1),
t_2_Proj AS (SELECT * FROM (
  
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
  Projects.id AS id,
  SUM(1) AS n
FROM
  t_0_Projects AS Projects, t_2_Proj AS Proj, LATERAL (SELECT synalog_u.value FROM (SELECT Projects.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_4
WHERE
  (Proj.pid = JSON_VALUE(x_4.value, '$' RETURNING DOUBLE))
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id, n IS NULL, n;