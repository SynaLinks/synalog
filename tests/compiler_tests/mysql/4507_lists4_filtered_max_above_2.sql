-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(1, 2, 3) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_ARRAY(7) AS l
   UNION ALL
  
    SELECT
      4 AS k,
      JSON_ARRAY(5, 5, 9, 1) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_L.k AS k,
  (SELECT
  MAX(JSON_VALUE(x_4.value, '$' RETURNING DOUBLE)) AS synalog_value
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT t_0_L.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_4
WHERE
  (JSON_VALUE(x_4.value, '$' RETURNING DOUBLE) > 2)) AS m
FROM
  t_1_L AS t_0_L
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;