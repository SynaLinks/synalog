-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      null AS k,
      0 AS a
   UNION ALL
  
    SELECT
      1 AS k,
      1 AS a
  
) AS UNUSED_TABLE_NAME  ),
t_3_B AS (SELECT * FROM (
  
    SELECT
      null AS k,
      0 AS b
   UNION ALL
  
    SELECT
      1 AS k,
      1 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_A.a AS a
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (t_1_B.k = t_0_A.k);