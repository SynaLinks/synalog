-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Gv AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      null AS b
   UNION ALL
  
    SELECT
      2 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Gv.a AS a,
  GREATEST(Gv.a, Gv.b) AS g,
  LEAST(Gv.a, Gv.b) AS l,
  GREATEST(Gv.a, 2.5e0, COALESCE(Gv.b, 0)) AS h
FROM
  t_0_Gv AS Gv
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a;