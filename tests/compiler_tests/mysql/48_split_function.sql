-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_Rows AS (SELECT * FROM (
  
    SELECT
      'a,b,c' AS line
   UNION ALL
  
    SELECT
      'x,y' AS line
  
) AS UNUSED_TABLE_NAME  ),
t_0_Parsed AS (SELECT * FROM (
SELECT
  t_1_Rows.line AS line,
  JSON_LENGTH(CAST(CONCAT('[', REPLACE(JSON_QUOTE(t_1_Rows.line), SUBSTR(JSON_QUOTE(','), 2, CHAR_LENGTH(JSON_QUOTE(',')) - 2), '","'), ']') AS JSON)) AS n,
  (JSON_UNQUOTE(NULLIF((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(CAST(CONCAT('[', REPLACE(JSON_QUOTE(t_1_Rows.line), SUBSTR(JSON_QUOTE(','), 2, CHAR_LENGTH(JSON_QUOTE(',')) - 2), '","'), ']') AS JSON), CONCAT('$[', 0, ']')) END), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS first
FROM
  t_2_Rows AS t_1_Rows
) AS UNUSED_TABLE_NAME ORDER BY line IS NULL, line)
SELECT * FROM (
SELECT
  Parsed.line AS line,
  Parsed.n AS n,
  Parsed.first AS first
FROM
  t_0_Parsed AS Parsed
) AS UNUSED_TABLE_NAME ORDER BY line IS NULL, line;