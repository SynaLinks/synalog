-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      'a' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'x' AS g,
      'b' AS n,
      2 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'c' AS n,
      9 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'd' AS n,
      4 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  V.g AS g,
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(V.n), '$[0]') ORDER BY V.s IS NULL ASC, V.s ASC SEPARATOR ','), ']') AS JSON), '$[0]') AS w
FROM
  t_1_V AS V
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;