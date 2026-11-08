-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('name', 'a', 'xs', JSON_ARRAY(JSON_OBJECT('v', 1), JSON_OBJECT('v', 2))) AS r
   UNION ALL
  
    SELECT
      JSON_OBJECT('name', 'b', 'xs', JSON_ARRAY(JSON_OBJECT('v', 5))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  (JSON_UNQUOTE(NULLIF(JSON_EXTRACT(t_0_R.r, '$."name"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS name,
  JSON_VALUE(JSON_EXTRACT(NULLIF(x_1.value, CAST('null' AS JSON)), '$."v"'), '$' RETURNING DOUBLE) AS v
FROM
  t_1_R AS t_0_R, LATERAL (SELECT synalog_u.value FROM (SELECT NULLIF(JSON_EXTRACT(t_0_R.r, '$."xs"'), CAST('null' AS JSON)) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_1
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name, v IS NULL, v;