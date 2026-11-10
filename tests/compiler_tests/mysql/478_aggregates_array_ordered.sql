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
      3 AS k,
      'c' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(t_0_V.v), '$[0]') ORDER BY t_0_V.k IS NULL ASC, t_0_V.k ASC SEPARATOR ','), ']') AS JSON) AS l
FROM
  t_3_V AS t_0_V;