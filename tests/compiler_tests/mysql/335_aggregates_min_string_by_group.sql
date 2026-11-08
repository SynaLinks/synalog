-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS g,
      'cat' AS s
   UNION ALL
  
    SELECT
      1 AS g,
      'ant' AS s
   UNION ALL
  
    SELECT
      2 AS g,
      'bee' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  V.g AS g,
  MIN(V.s) AS m
FROM
  t_0_V AS V
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;