-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      17 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      -17 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      4 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      0 AS x
   UNION ALL
  
    SELECT
      5 AS k,
      null AS x
   UNION ALL
  
    SELECT
      6 AS k,
      3000000000 AS x
   UNION ALL
  
    SELECT
      7 AS k,
      -1 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_X.k AS k,
  EXP(t_0_X.x) AS v
FROM
  t_1_X AS t_0_X
WHERE
  (ABS(t_0_X.x) < 10)
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;