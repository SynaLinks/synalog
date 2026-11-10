-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Lo AS (SELECT
  MIN(JSON_VALUE(x_4.value, '$' RETURNING DOUBLE)) AS m
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2, 3) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_4),
t_0_Hi AS (SELECT
  MAX(JSON_VALUE(x_4.value, '$' RETURNING DOUBLE)) AS m
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2, 3) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_4)
SELECT * FROM (
  
    SELECT
      'min' AS k,
      Lo.m AS v
    FROM
      t_0_Lo AS Lo
   UNION ALL
  
    SELECT
      'max' AS k,
      Hi.m AS v
    FROM
      t_0_Hi AS Hi
  
) AS UNUSED_TABLE_NAME  ORDER BY k IS NULL, k ;