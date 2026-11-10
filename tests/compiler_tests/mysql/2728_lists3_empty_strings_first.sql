-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_S AS (SELECT * FROM (
  
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
  S.k AS k,
  (JSON_UNQUOTE(NULLIF((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(S.l, CONCAT('$[', 0, ']')) END), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS e
FROM
  t_0_S AS S
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;