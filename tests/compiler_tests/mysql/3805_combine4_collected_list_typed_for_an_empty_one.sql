-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_4_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_L AS (SELECT
  'a' AS src,
  JSON_ARRAYAGG(A.x) AS l
FROM
  t_4_A AS A
GROUP BY 1),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      t_3_L AS t_2_L
   UNION ALL
  
    SELECT
      'b' AS src,
      JSON_ARRAY() AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_All.src AS src,
  JSON_LENGTH(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All
) AS UNUSED_TABLE_NAME ORDER BY src IS NULL, src;