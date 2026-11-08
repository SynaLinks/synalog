-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Employee AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      'Engineering' AS department,
      75000 AS salary
   UNION ALL
  
    SELECT
      'Bob' AS name,
      'Marketing' AS department,
      65000 AS salary
   UNION ALL
  
    SELECT
      'Charlie' AS name,
      'Engineering' AS department,
      80000 AS salary
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Employee.name AS name
FROM
  t_0_Employee AS Employee
WHERE
  (Employee.department = 'Engineering')
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;