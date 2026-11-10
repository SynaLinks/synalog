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
      'x' AS g,
      2 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS k,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_V.g AS g,
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(t_0_V.v), '$[0]') ORDER BY t_0_V.k IS NULL ASC, t_0_V.k ASC SEPARATOR ','), ']') AS JSON) AS l
FROM
  t_3_V AS t_0_V
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;