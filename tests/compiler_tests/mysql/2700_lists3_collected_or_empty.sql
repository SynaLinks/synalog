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
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_C AS (SELECT
  V.g AS g,
  JSON_ARRAYAGG(V.x) AS l
FROM
  t_3_V AS V
GROUP BY 1),
t_5_G AS (SELECT * FROM (
  
    SELECT
      'a' AS g
   UNION ALL
  
    SELECT
      'b' AS g
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      C.g AS g,
      C.l AS l
    FROM
      t_2_C AS C
   UNION ALL
  
    SELECT
      t_4_G.g AS g,
      JSON_ARRAY() AS l
    FROM
      t_5_G AS t_4_G
    WHERE
      ((SELECT
        MIN(1) AS synalog_value
      FROM
        t_2_C AS t_6_C
      WHERE
        (t_6_C.g = t_4_G.g)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_L.g AS g,
  JSON_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L
) AS UNUSED_TABLE_NAME ORDER BY g IS NULL, g;