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
      'a' AS g,
      1 AS h,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      1 AS h,
      2 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS h,
      4 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS h,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  V.g AS g,
  V.h AS h,
  SUM(V.x) AS t
FROM
  t_0_V AS V
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g, h IS NULL, h;