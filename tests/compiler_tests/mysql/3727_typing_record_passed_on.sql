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
      1 AS id,
      JSON_OBJECT('name', 'a', 'tags', JSON_ARRAY('x'), 'score', 1.5e0) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'b', 'tags', JSON_ARRAY(), 'score', null) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  P.id AS id,
  (JSON_UNQUOTE(NULLIF(JSON_EXTRACT(P.r, '$."name"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS name,
  JSON_LENGTH(NULLIF(JSON_EXTRACT(P.r, '$."tags"'), CAST('null' AS JSON))) AS n,
  JSON_VALUE(JSON_EXTRACT(P.r, '$."score"'), '$' RETURNING DOUBLE) AS s
FROM
  t_0_P AS P
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id;