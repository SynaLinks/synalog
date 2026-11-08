-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      'p' AS n,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      'q' AS n,
      5 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      'r' AS n,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_M AS (SELECT
  t_3_V.g AS g,
  MAX(t_3_V.x) AS m
FROM
  t_1_V AS t_3_V
GROUP BY 1)
SELECT * FROM (
SELECT
  V.g AS g,
  V.n AS n
FROM
  t_1_V AS V, t_2_M AS t_0_M
WHERE
  (t_0_M.g = V.g) AND
  (t_0_M.m = V.x)
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;