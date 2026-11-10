-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(JSON_OBJECT('n', 'a', 'v', 1), JSON_OBJECT('n', 'b', 'v', 2)) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY(JSON_OBJECT('n', 'c', 'v', 3)) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  (JSON_UNQUOTE(NULLIF(JSON_EXTRACT(NULLIF(x_1.value, CAST('null' AS JSON)), '$."n"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS n
FROM
  t_0_T AS T, LATERAL (SELECT synalog_u.value FROM (SELECT T.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_1
WHERE
  (JSON_VALUE(JSON_EXTRACT(NULLIF(x_1.value, CAST('null' AS JSON)), '$."v"'), '$' RETURNING DOUBLE) > 1)
) AS UNUSED_TABLE_NAME ORDER BY n IS NULL, n;