-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  R.k AS k,
  COUNT(DISTINCT R.v) AS n
FROM
  t_0_R AS R
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;