-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS v
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  JSON_ARRAYAGG(JSON_OBJECT('n', t_2_V.n, 'v', t_2_V.v)) AS l
FROM
  t_3_V AS t_2_V)
SELECT * FROM (
SELECT
  JSON_EXTRACT(NULLIF(x_1.value, CAST('null' AS JSON)), '$."n"') AS n,
  JSON_EXTRACT(NULLIF(x_1.value, CAST('null' AS JSON)), '$."v"') AS v
FROM
  t_1_L AS t_0_L, LATERAL (SELECT synalog_u.value FROM (SELECT t_0_L.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_1
) AS UNUSED_TABLE_NAME ORDER BY n IS NULL, n;