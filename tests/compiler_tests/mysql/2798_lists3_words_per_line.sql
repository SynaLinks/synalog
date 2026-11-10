-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_W AS (SELECT * FROM (
  
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
  W.id AS id,
  JSON_LENGTH(CAST(CONCAT('[', REPLACE(JSON_QUOTE(W.s), SUBSTR(JSON_QUOTE(' '), 2, CHAR_LENGTH(JSON_QUOTE(' ')) - 2), '","'), ']') AS JSON)) AS n
FROM
  t_0_W AS W
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id, n IS NULL, n;