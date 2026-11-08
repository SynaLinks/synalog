-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_5_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'a' AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(t_2_V.v), '$[0]') ORDER BY t_2_V.k IS NULL ASC, t_2_V.k ASC SEPARATOR ','), ']') AS JSON) AS l
FROM
  t_5_V AS t_2_V)
SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(t_0_L.l, CONCAT('$[', 0, ']')) END) AS first
FROM
  t_1_L AS t_0_L;