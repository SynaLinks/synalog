-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_3_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_4_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_All_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_3_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_4_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT
  All_MultBodyAggAux.x AS x
FROM
  t_2_All_MultBodyAggAux AS All_MultBodyAggAux
GROUP BY 1),
t_5_Pick AS (SELECT * FROM (
  
    SELECT
      5 AS x
    FROM
      t_3_A AS t_6_A
    WHERE
      (t_6_A.x = 5)
   UNION ALL
  
    SELECT
      5 AS x
    FROM
      t_4_B AS t_7_B
    WHERE
      (t_7_B.x = 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_All.x AS x
FROM
  t_1_All AS t_0_All
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_5_Pick AS Pick
  WHERE
    (Pick.x = t_0_All.x)) IS NULL)
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;