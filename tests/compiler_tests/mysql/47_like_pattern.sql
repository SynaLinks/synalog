-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      'alice' AS name
   UNION ALL
  
    SELECT
      'alan' AS name
   UNION ALL
  
    SELECT
      'bob' AS name
   UNION ALL
  
    SELECT
      'albert' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_StartsWithAl AS (SELECT * FROM (
SELECT
  Names.name AS name
FROM
  t_1_Names AS Names
WHERE
  (Names.name LIKE 'al%' ESCAPE '\')
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name)
SELECT * FROM (
SELECT
  StartsWithAl.name AS name
FROM
  t_0_StartsWithAl AS StartsWithAl
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;