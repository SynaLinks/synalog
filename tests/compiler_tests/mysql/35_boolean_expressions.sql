-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      5 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Filtered AS (SELECT * FROM (
SELECT
  Data.a AS a,
  Data.b AS b
FROM
  t_1_Data AS Data
WHERE
  (Data.a >= Data.b)
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a)
SELECT * FROM (
SELECT
  Filtered.a AS a,
  Filtered.b AS b
FROM
  t_0_Filtered AS Filtered
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a;