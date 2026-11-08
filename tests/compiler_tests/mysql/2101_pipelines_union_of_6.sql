-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      JSON_VALUE(x_4.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(0, 1) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_4
   UNION ALL
  
    SELECT
      JSON_VALUE(x_6.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(2, 3) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_6
   UNION ALL
  
    SELECT
      JSON_VALUE(x_8.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(4, 5) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_8
   UNION ALL
  
    SELECT
      JSON_VALUE(x_10.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(6, 7) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_10
   UNION ALL
  
    SELECT
      JSON_VALUE(x_12.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(8, 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_12
   UNION ALL
  
    SELECT
      JSON_VALUE(x_14.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(10, 11) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_14
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;