-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;
CREATE DATABASE IF NOT EXISTS synalog_home DEFAULT COLLATE utf8mb4_0900_bin;

DROP TABLE IF EXISTS synalog_home.W;
CREATE TABLE synalog_home.W AS WITH t_0_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      JSON_VALUE(x_3.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(0, 1) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3
   UNION ALL
  
    SELECT
      JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(2, 3) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_5
   UNION ALL
  
    SELECT
      JSON_VALUE(x_7.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(4, 5) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_7
   UNION ALL
  
    SELECT
      JSON_VALUE(x_9.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(6, 7) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_9
   UNION ALL
  
    SELECT
      JSON_VALUE(x_11.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(8, 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_11
   UNION ALL
  
    SELECT
      JSON_VALUE(x_13.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(10, 11) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_13
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(12, 13) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
   UNION ALL
  
    SELECT
      JSON_VALUE(x_17.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(14, 15) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_17
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_0_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1;

-- Interacting with table synalog_home.W

SELECT
  SUM(1) AS n
FROM
  synalog_home.W AS W;