-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_JsonData AS (SELECT * FROM (
  
    SELECT
      'Alice' AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      25 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  JsonData.col0 AS col0,
  JsonData.col1 AS col1
FROM
  t_0_JsonData AS JsonData
) AS UNUSED_TABLE_NAME ORDER BY col0 IS NULL, col0;