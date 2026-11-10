-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Lists AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_ARRAY(1, 2) AS a,
      JSON_ARRAY(3, 4) AS b
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_ARRAY(5) AS a,
      JSON_ARRAY(6, 7, 8) AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Concatenated AS (SELECT * FROM (
SELECT
  Lists.id AS id,
  JSON_LENGTH(JSON_MERGE_PRESERVE(Lists.a, Lists.b)) AS total_size,
  JSON_VALUE((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(JSON_MERGE_PRESERVE(Lists.a, Lists.b), CONCAT('$[', 0, ']')) END), '$' RETURNING DOUBLE) AS head
FROM
  t_1_Lists AS Lists
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id)
SELECT * FROM (
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id;