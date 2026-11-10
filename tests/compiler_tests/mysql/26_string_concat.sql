-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'John' AS col0,
      'Doe' AS col1
   UNION ALL
  
    SELECT
      'Jane' AS col0,
      'Smith' AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      '' AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Person.col0 AS first,
  Person.col1 AS last,
  (CONCAT((CONCAT(Person.col0, ' ')), Person.col1)) AS full_name
FROM
  t_0_Person AS Person
) AS UNUSED_TABLE_NAME ORDER BY full_name IS NULL, full_name;