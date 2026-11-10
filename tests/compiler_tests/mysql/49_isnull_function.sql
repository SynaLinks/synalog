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
      1 AS id,
      10 AS value
   UNION ALL
  
    SELECT
      2 AS id,
      null AS value
   UNION ALL
  
    SELECT
      3 AS id,
      30 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_Flags AS (SELECT * FROM (
SELECT
  Data.id AS id,
  (Data.value IS NULL) AS missing
FROM
  t_1_Data AS Data
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id)
SELECT * FROM (
SELECT
  Flags.id AS id,
  Flags.missing AS missing
FROM
  t_0_Flags AS Flags
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id;