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
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      V.k AS a,
      t_1_V.k AS b
    FROM
      t_3_V AS V, t_3_V AS t_1_V
    WHERE
      (V.k < t_1_V.k) AND
      (((V.x) * (V.x)) = ((((t_1_V.x) * (t_1_V.x))) + (7)))
   UNION ALL
  
    SELECT
      t_4_V.k AS a,
      t_5_V.k AS b
    FROM
      t_3_V AS t_4_V, t_3_V AS t_5_V
    WHERE
      (t_4_V.k < t_5_V.k) AND
      (((t_4_V.x) * (t_4_V.x)) = ((t_5_V.x) * (t_5_V.x)))
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Q_MultBodyAggAux.a AS a,
  Q_MultBodyAggAux.b AS b
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a, b IS NULL, b;