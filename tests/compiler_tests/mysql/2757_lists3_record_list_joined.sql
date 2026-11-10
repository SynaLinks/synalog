-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_OBJECT('name', 'a', 'tags', JSON_ARRAY('x', 'y')) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'b', 'tags', JSON_ARRAY()) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      JSON_OBJECT('name', 'c', 'tags', JSON_ARRAY('y')) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_R.id AS id,
  (CASE WHEN NULLIF(JSON_EXTRACT(t_0_R.r, '$."tags"'), CAST('null' AS JSON)) IS NULL OR '+' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(synalog_j.v ORDER BY synalog_j.i SEPARATOR '+') FROM (SELECT NULLIF(JSON_EXTRACT(t_0_R.r, '$."tags"'), CAST('null' AS JSON)) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (i FOR ORDINALITY, v TEXT COLLATE utf8mb4_0900_bin PATH '$')) AS synalog_j), '') END) AS s
FROM
  t_1_R AS t_0_R
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id, s IS NULL, s;