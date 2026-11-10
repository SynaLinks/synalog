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
      'alice' AS first,
      'smith' AS last
   UNION ALL
  
    SELECT
      'bob' AS first,
      'jones' AS last
   UNION ALL
  
    SELECT
      'charlie' AS first,
      'brown' AS last
  
) AS UNUSED_TABLE_NAME  ),
t_0_FormattedNames AS (SELECT * FROM (
SELECT
  Names.first AS first,
  UPPER(Names.first) AS upper_first,
  CHAR_LENGTH(Names.last) AS len
FROM
  t_1_Names AS Names
) AS UNUSED_TABLE_NAME ORDER BY first IS NULL, first)
SELECT * FROM (
SELECT
  FormattedNames.first AS first,
  FormattedNames.upper_first AS upper_first,
  FormattedNames.len AS len
FROM
  t_0_FormattedNames AS FormattedNames
) AS UNUSED_TABLE_NAME ORDER BY first IS NULL, first;