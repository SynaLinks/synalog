-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;
CREATE DATABASE IF NOT EXISTS synalog_home;

DROP TABLE IF EXISTS synalog_home.V;
CREATE TABLE synalog_home.V ENGINE = Memory AS WITH t_0_S AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.d AS d,
  S.v AS v
FROM
  t_0_S AS S
WHERE
  (S.r = 'east');

-- Interacting with table synalog_home.V

DROP TABLE IF EXISTS synalog_home.Pos;
CREATE TABLE synalog_home.Pos ENGINE = Memory AS WITH t_1_Before_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_V.d AS d,
      t_3_V.d AS e
    FROM
      synalog_home.V AS t_2_V, synalog_home.V AS t_3_V
    WHERE
      (t_3_V.v < t_2_V.v)
   UNION ALL
  
    SELECT
      t_4_V.d AS d,
      t_5_V.d AS e
    FROM
      synalog_home.V AS t_4_V, synalog_home.V AS t_5_V
    WHERE
      (t_5_V.d < t_4_V.d) AND
      (t_5_V.v = t_4_V.v)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Before AS (SELECT
  Before_MultBodyAggAux.d AS d,
  Before_MultBodyAggAux.e AS e
FROM
  t_1_Before_MultBodyAggAux AS Before_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  V.d AS d,
  V.v AS v,
  COALESCE((SELECT
  SUM(1) AS synalog_value
FROM
  t_0_Before AS Before
WHERE
  (Before.d = V.d)), 0) AS pos
FROM
  synalog_home.V AS V;

-- Interacting with table synalog_home.Pos

DROP TABLE IF EXISTS synalog_home.N;
CREATE TABLE synalog_home.N ENGINE = Memory AS SELECT
  SUM(1) AS n
FROM
  synalog_home.V AS V;

-- Interacting with table synalog_home.N

WITH t_0_Mid AS (SELECT * FROM (
  
    SELECT
      t_1_Pos.v AS v
    FROM
      synalog_home.Pos AS t_1_Pos, synalog_home.N AS t_2_N
    WHERE
      (((((2) * (t_1_Pos.pos))) + (1)) = t_2_N.n)
   UNION ALL
  
    SELECT
      t_3_Pos.v AS v
    FROM
      synalog_home.Pos AS t_3_Pos, synalog_home.N AS t_4_N
    WHERE
      (((2) * (t_3_Pos.pos)) = t_4_N.n)
   UNION ALL
  
    SELECT
      t_5_Pos.v AS v
    FROM
      synalog_home.Pos AS t_5_Pos, synalog_home.N AS t_6_N
    WHERE
      (((((2) * (t_5_Pos.pos))) + (2)) = t_6_N.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(Mid.v) AS m
FROM
  t_0_Mid AS Mid;