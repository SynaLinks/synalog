-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_3_T AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      0 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_M AS (SELECT
  t_2_T.g AS g,
  MIN(t_2_T.x) AS m
FROM
  t_3_T AS t_2_T
GROUP BY 1),
t_4_S AS (SELECT
  t_5_T.g AS g,
  SUM(t_5_T.x) AS t
FROM
  t_3_T AS t_5_T
GROUP BY 1)
SELECT * FROM (
SELECT
  t_0_M.g AS g,
  (CAST(t_0_M.m AS DOUBLE) / NULLIF(S.t, 0)) AS share
FROM
  t_1_M AS t_0_M, t_4_S AS S
WHERE
  (S.g = t_0_M.g)
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;