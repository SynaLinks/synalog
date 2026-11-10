-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      'ann' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/ann' AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      'bob' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/bob' AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      'cid' AS name,
      'ops' AS dept,
      20 AS team_id,
      'inactive' AS status,
      'https://x/cid' AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      'dan' AS name,
      'ops' AS dept,
      20 AS team_id,
      'active' AS status,
      'https://x/dan' AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      'eve' AS name,
      'eng' AS dept,
      30 AS team_id,
      'active' AS status,
      'https://x/eve' AS url
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Employees.dept AS dept
FROM
  t_0_Employees AS Employees
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY dept IS NULL, dept;