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
      JSON_OBJECT('name', 'ann', 'home', JSON_OBJECT('city', 'paris'), 'age', 31, 'tags', JSON_ARRAY('a', 'b')) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'bob', 'home', JSON_OBJECT('city', 'oslo'), 'age', null, 'tags', JSON_ARRAY()) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      JSON_OBJECT('name', 'cid', 'home', JSON_OBJECT('city', 'paris'), 'age', 45, 'tags', JSON_ARRAY('c')) AS r
   UNION ALL
  
    SELECT
      4 AS id,
      JSON_OBJECT('name', 'dee', 'home', JSON_OBJECT('city', null), 'age', 22, 'tags', JSON_ARRAY('a')) AS r
   UNION ALL
  
    SELECT
      5 AS id,
      JSON_OBJECT('name', 'eve', 'home', JSON_OBJECT('city', 'rome'), 'age', 38, 'tags', JSON_ARRAY('b', 'c', 'd')) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  P.id AS id
FROM
  t_0_P AS P, LATERAL (SELECT synalog_u.value FROM (SELECT NULLIF(JSON_EXTRACT(P.r, '$."tags"'), CAST('null' AS JSON)) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3
WHERE
  ('c' = (JSON_UNQUOTE(NULLIF(x_3.value, CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin))
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id;