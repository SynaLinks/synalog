-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_A AS (SELECT * FROM (
  
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
t_2_B AS (SELECT * FROM (
  
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
t_3_C AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      9 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_1_A AS A
    WHERE
      (A.x > 5)
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_2_B AS B
    WHERE
      (B.x > 5)
   UNION ALL
  
    SELECT
      C.x AS x
    FROM
      t_3_C AS C
    WHERE
      (C.x > 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;