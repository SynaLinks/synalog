-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_P AS (SELECT * FROM (
  
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
      t_1_P.b AS x
    FROM
      t_2_P AS t_1_P
    WHERE
      (t_1_P.a = 3)
   UNION ALL
  
    SELECT
      t_4_P.b AS x
    FROM
      t_2_P AS t_3_P, t_2_P AS t_4_P
    WHERE
      (t_3_P.a = 3) AND
      (t_4_P.a = t_3_P.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Q_MultBodyAggAux.x AS x
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;