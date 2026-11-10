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
      JSON_OBJECT('name', 'a', 'xs', JSON_ARRAY(1, 2, 3)) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('name', 'b', 'xs', JSON_ARRAY(4)) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_OBJECT('name', 'c', 'xs', JSON_ARRAY()) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  S.k AS k,
  JSON_LENGTH(NULLIF(JSON_EXTRACT(S.r, '$."xs"'), CAST('null' AS JSON))) AS n
FROM
  t_0_S AS S
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;