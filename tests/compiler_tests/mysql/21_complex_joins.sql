-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Alice' AS name,
      101 AS dept
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      102 AS dept
   UNION ALL
  
    SELECT
      3 AS id,
      'Charlie' AS name,
      101 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_Departments AS (SELECT * FROM (
  
    SELECT
      101 AS id,
      'Engineering' AS name
   UNION ALL
  
    SELECT
      102 AS id,
      'Marketing' AS name
   UNION ALL
  
    SELECT
      103 AS id,
      'Sales' AS name
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Users.name AS user_name,
  Departments.name AS dept_name
FROM
  t_0_Users AS Users, t_1_Departments AS Departments
WHERE
  (Departments.id = Users.dept)
) AS UNUSED_TABLE_NAME ORDER BY user_name IS NULL, user_name;