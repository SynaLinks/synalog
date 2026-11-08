-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_Values AS (SELECT * FROM (
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_Values.a AS a,
  t_0_Values.b AS b,
  ((((t_0_Values.a) * (t_0_Values.a))) + (((t_0_Values.b) * (t_0_Values.b)))) AS result
FROM
  t_2_Values AS t_0_Values
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a;