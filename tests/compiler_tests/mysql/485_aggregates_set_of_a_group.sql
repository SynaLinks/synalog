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
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      7 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_S AS (SELECT
  V.g AS g,
  CAST(CONCAT('[', GROUP_CONCAT(DISTINCT JSON_EXTRACT(JSON_ARRAY(V.x), '$[0]') ORDER BY JSON_EXTRACT(JSON_ARRAY(V.x), '$[0]') SEPARATOR ','), ']') AS JSON) AS s
FROM
  t_2_V AS V
GROUP BY 1)
SELECT * FROM (
SELECT
  t_0_S.g AS g,
  JSON_LENGTH(t_0_S.s) AS n
FROM
  t_1_S AS t_0_S
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;