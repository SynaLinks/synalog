-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS s
   UNION ALL
  
    SELECT
      JSON_VALUE(x_6.value, '$' RETURNING DOUBLE) AS k,
      CASE WHEN (JSON_VALUE(x_6.value, '$' RETURNING DOUBLE) = 2) THEN 'b' ELSE 'c' END AS s
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(2, 3) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_6
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  U.k AS k,
  U.s AS s
FROM
  t_0_U AS U
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;