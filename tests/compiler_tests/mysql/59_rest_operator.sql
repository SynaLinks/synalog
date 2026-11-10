-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Record AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c
  
) AS UNUSED_TABLE_NAME  ),
t_0_CopyAll AS (SELECT * FROM (
SELECT
  Record.*
FROM
  t_1_Record AS Record
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a)
SELECT * FROM (
SELECT
  CopyAll.a AS a,
  CopyAll.b AS b,
  CopyAll.c AS c
FROM
  t_0_CopyAll AS CopyAll
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a;