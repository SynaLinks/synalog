-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(3, 4) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_ARRAY(5) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  F.k AS k,
  SUM(JSON_VALUE(x_3.value, '$' RETURNING DOUBLE)) AS t
FROM
  t_0_F AS F, LATERAL (SELECT synalog_u.value FROM (SELECT F.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;