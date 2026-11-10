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
      1 AS k,
      JSON_OBJECT('xs', JSON_ARRAY('z')) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('xs', CAST(NULL AS JSON)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_R.k AS k,
  JSON_LENGTH(NULLIF(JSON_EXTRACT(t_0_R.r, '$."xs"'), CAST('null' AS JSON))) AS n
FROM
  t_1_R AS t_0_R
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;