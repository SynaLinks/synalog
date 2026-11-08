-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_O AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  O.id AS id
FROM
  t_0_O AS O
WHERE
  (O.amt > (SELECT
    AVG(CAST(t_1_O.amt AS DOUBLE)) AS synalog_value
  FROM
    t_0_O AS t_1_O
  WHERE
    (t_1_O.c = O.c)))
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id;