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
      10 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      12 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  V.a AS a,
  V.b AS b,
  (MOD(V.a, NULLIF(V.b, 0))) AS r
FROM
  t_0_V AS V
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a;