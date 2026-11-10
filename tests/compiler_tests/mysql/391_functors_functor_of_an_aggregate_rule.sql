-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_S1 AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS g,
      4 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_R0 AS (SELECT
  S1.g AS g,
  SUM(S1.v) AS t
FROM
  t_1_S1 AS S1
GROUP BY 1)
SELECT * FROM (
SELECT
  R0.g AS g,
  R0.t AS t
FROM
  t_0_R0 AS R0
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;