-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY('a', 'b') AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      CAST(NULL AS JSON) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_S.k AS k,
  (CASE WHEN t_0_S.l IS NULL OR '+' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(synalog_j.v ORDER BY synalog_j.i SEPARATOR '+') FROM (SELECT t_0_S.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (i FOR ORDINALITY, v TEXT COLLATE utf8mb4_0900_bin PATH '$')) AS synalog_j), '') END) AS s
FROM
  t_1_S AS t_0_S
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;