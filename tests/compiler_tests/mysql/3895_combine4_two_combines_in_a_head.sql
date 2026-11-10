-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_O AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS c,
      30 AS amt
   UNION ALL
  
    SELECT
      2 AS id,
      'ann' AS c,
      12 AS amt
   UNION ALL
  
    SELECT
      3 AS id,
      'bob' AS c,
      50 AS amt
   UNION ALL
  
    SELECT
      4 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      5 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      6 AS id,
      'cid' AS c,
      40 AS amt
   UNION ALL
  
    SELECT
      7 AS id,
      'bob' AS c,
      5 AS amt
  
) AS UNUSED_TABLE_NAME  ),
t_3_C AS (SELECT * FROM (
  
    SELECT
      'ann' AS c
   UNION ALL
  
    SELECT
      'bob' AS c
   UNION ALL
  
    SELECT
      'cid' AS c
   UNION ALL
  
    SELECT
      'dee' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_C.c AS c,
  (SELECT
  SUM(O.amt) AS synalog_value
FROM
  t_1_O AS O
WHERE
  (O.c = t_0_C.c)) AS t,
  (SELECT
  SUM(1) AS synalog_value
FROM
  t_1_O AS t_2_O
WHERE
  (t_2_O.c = t_0_C.c)) AS n
FROM
  t_3_C AS t_0_C
) AS UNUSED_TABLE_NAME ORDER BY c IS NULL, c;