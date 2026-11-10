-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS n
   UNION ALL
  
    SELECT
      'x' AS g,
      2 AS n
   UNION ALL
  
    SELECT
      'y' AS g,
      3 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  V.g AS g,
  JSON_ARRAYAGG(JSON_OBJECT('n', V.n)) AS l
FROM
  t_2_V AS V
GROUP BY 1)
SELECT * FROM (
SELECT
  t_0_C.g AS g,
  SUM(1) AS c
FROM
  t_1_C AS t_0_C, LATERAL (SELECT synalog_u.value FROM (SELECT t_0_C.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3
WHERE
  (JSON_EXTRACT(NULLIF(x_3.value, CAST('null' AS JSON)), '$."n"') > 0)
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;