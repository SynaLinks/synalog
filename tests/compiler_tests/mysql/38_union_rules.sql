-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Students AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      85 AS grade
   UNION ALL
  
    SELECT
      'Bob' AS name,
      72 AS grade
  
) AS UNUSED_TABLE_NAME  ),
t_2_Teachers AS (SELECT * FROM (
  
    SELECT
      'Prof Smith' AS name,
      'Math' AS department
   UNION ALL
  
    SELECT
      'Prof Jones' AS name,
      'Science' AS department
  
) AS UNUSED_TABLE_NAME  ),
t_0_People AS (SELECT * FROM (
  
    SELECT
      Students.name AS name,
      'student' AS role
    FROM
      t_1_Students AS Students
   UNION ALL
  
    SELECT
      Teachers.name AS name,
      'teacher' AS role
    FROM
      t_2_Teachers AS Teachers
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  People.name AS name,
  People.role AS role
FROM
  t_0_People AS People
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;