-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_4_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_5_N AS (SELECT
  SUM(1) AS n
FROM
  t_4_S AS t_7_S
WHERE
  (t_7_S.r = 'east')),
t_10_Before_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_13_S.d AS d,
      t_14_S.d AS e
    FROM
      t_4_S AS t_13_S, t_4_S AS t_14_S
    WHERE
      (t_14_S.v < t_13_S.v) AND
      (t_13_S.r = 'east') AND
      (t_14_S.r = 'east')
   UNION ALL
  
    SELECT
      t_17_S.d AS d,
      t_18_S.d AS e
    FROM
      t_4_S AS t_17_S, t_4_S AS t_18_S
    WHERE
      (t_18_S.d < t_17_S.d) AND
      (t_18_S.v = t_17_S.v) AND
      (t_17_S.r = 'east') AND
      (t_18_S.r = 'east')
  
) AS UNUSED_TABLE_NAME  ),
t_9_Before AS (SELECT
  Before_MultBodyAggAux.d AS d,
  Before_MultBodyAggAux.e AS e
FROM
  t_10_Before_MultBodyAggAux AS Before_MultBodyAggAux
GROUP BY 1, 2),
t_0_Mid AS (SELECT * FROM (
  
    SELECT
      S.v AS v
    FROM
      t_4_S AS S, t_5_N AS t_2_N
    WHERE
      (((((2) * (COALESCE((SELECT
        SUM(1) AS synalog_value
      FROM
        t_9_Before AS t_8_Before
      WHERE
        (t_8_Before.d = S.d)), 0)))) + (1)) = t_2_N.n) AND
      (S.r = 'east')
   UNION ALL
  
    SELECT
      t_22_S.v AS v
    FROM
      t_4_S AS t_22_S, t_5_N AS t_20_N
    WHERE
      (((2) * (COALESCE((SELECT
        SUM(1) AS synalog_value
      FROM
        t_9_Before AS t_25_Before
      WHERE
        (t_25_Before.d = t_22_S.d)), 0))) = t_20_N.n) AND
      (t_22_S.r = 'east')
   UNION ALL
  
    SELECT
      t_38_S.v AS v
    FROM
      t_4_S AS t_38_S, t_5_N AS t_36_N
    WHERE
      (((((2) * (COALESCE((SELECT
        SUM(1) AS synalog_value
      FROM
        t_9_Before AS t_39_Before
      WHERE
        (t_39_Before.d = t_38_S.d)), 0)))) + (2)) = t_36_N.n) AND
      (t_38_S.r = 'east')
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(CAST(Mid.v AS DOUBLE)) AS m
FROM
  t_0_Mid AS Mid;