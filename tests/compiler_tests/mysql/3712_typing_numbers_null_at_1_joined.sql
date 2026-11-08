-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_K AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      3 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(1, 2) AS v
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(NULL AS JSON) AS v
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_ARRAY(3) AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_K.k AS k,
  JSON_LENGTH(t_1_V.v) AS r
FROM
  t_2_K AS t_0_K, t_3_V AS t_1_V
WHERE
  (t_1_V.k = t_0_K.k)
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;