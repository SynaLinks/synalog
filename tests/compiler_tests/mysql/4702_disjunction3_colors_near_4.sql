-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_I AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red' AS c,
      10 AS p,
      null AS t
   UNION ALL
  
    SELECT
      2 AS id,
      'blue' AS c,
      25 AS p,
      'x' AS t
   UNION ALL
  
    SELECT
      3 AS id,
      'red' AS c,
      40 AS p,
      'y' AS t
   UNION ALL
  
    SELECT
      4 AS id,
      'green' AS c,
      5 AS p,
      null AS t
   UNION ALL
  
    SELECT
      5 AS id,
      'blue' AS c,
      60 AS p,
      'x' AS t
   UNION ALL
  
    SELECT
      6 AS id,
      null AS c,
      30 AS p,
      'z' AS t
   UNION ALL
  
    SELECT
      7 AS id,
      'green' AS c,
      45 AS p,
      'y' AS t
  
) AS UNUSED_TABLE_NAME  ),
t_4_P AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      7 AS a,
      6 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      I.c AS c
    FROM
      t_1_I AS I
    WHERE
      (I.c IS NOT null) AND
      (I.id = 4)
   UNION ALL
  
    SELECT
      t_3_I.c AS c
    FROM
      t_4_P AS t_2_P, t_1_I AS t_3_I
    WHERE
      (t_3_I.c IS NOT null) AND
      (t_2_P.a = 4) AND
      (t_3_I.id = t_2_P.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Q_MultBodyAggAux.c AS c
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY c IS NULL, c;