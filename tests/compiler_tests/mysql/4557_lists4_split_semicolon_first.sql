-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a,b,c' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      'abc' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      ',,' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      'x,' AS s
   UNION ALL
  
    SELECT
      6 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  T.k AS k,
  (JSON_UNQUOTE(NULLIF((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(CAST(CONCAT('[', REPLACE(JSON_QUOTE(T.s), SUBSTR(JSON_QUOTE(';'), 2, CHAR_LENGTH(JSON_QUOTE(';')) - 2), '","'), ']') AS JSON), CONCAT('$[', 0, ']')) END), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS v
FROM
  t_0_T AS T
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;