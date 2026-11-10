-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_P AS (SELECT * FROM (
  
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
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.k AS k,
  SUM(P.v) AS t
FROM
  t_0_P AS P
GROUP BY 1;