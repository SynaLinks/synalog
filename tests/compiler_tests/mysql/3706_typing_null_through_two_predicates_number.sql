-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  B.k AS k,
  B.v AS v
FROM
  t_0_B AS B
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;