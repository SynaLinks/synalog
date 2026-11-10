-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Names AS (SELECT * FROM (
  
    SELECT
      'Alice' AS first,
      'Smith' AS last
   UNION ALL
  
    SELECT
      'Bob' AS first,
      'Jones' AS last
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  (CONCAT((CONCAT(Names.first, ' ')), Names.last)) AS name
FROM
  t_0_Names AS Names
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;