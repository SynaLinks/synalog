-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      1 AS u
   UNION ALL
  
    SELECT
      2 AS u
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_U.u AS u,
  (SELECT
  MIN(false) AS synalog_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (t_0_U.u = 1)) AS l
FROM
  t_1_U AS t_0_U
) AS UNUSED_TABLE_NAME ORDER BY u IS NULL, u;