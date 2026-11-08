-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red green blue' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'red red' AS s
   UNION ALL
  
    SELECT
      3 AS id,
      'blue' AS s
   UNION ALL
  
    SELECT
      4 AS id,
      '' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_W.id AS id,
  (JSON_UNQUOTE(NULLIF((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(CAST(CONCAT('[', REPLACE(JSON_QUOTE(t_0_W.s), SUBSTR(JSON_QUOTE(' '), 2, CHAR_LENGTH(JSON_QUOTE(' ')) - 2), '","'), ']') AS JSON), CONCAT('$[', 0, ']')) END), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS w
FROM
  t_1_W AS t_0_W
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id, w IS NULL, w;