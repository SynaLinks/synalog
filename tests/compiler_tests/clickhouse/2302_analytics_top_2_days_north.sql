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

DROP TABLE IF EXISTS synalog_home.Better;
CREATE TABLE synalog_home.Better ENGINE = Memory AS WITH t_1_S AS (SELECT * FROM (
  
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
t_0_Better_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      S.d AS d,
      1 AS n
    FROM
      t_1_S AS S, t_1_S
    WHERE
      (t_1_S.v > S.v) AND
      (S.r = 'north') AND
      (t_1_S.r = 'north')
   UNION ALL
  
    SELECT
      t_2_S.d AS d,
      1 AS n
    FROM
      t_1_S AS t_2_S, t_1_S AS t_3_S
    WHERE
      (t_3_S.d < t_2_S.d) AND
      (t_2_S.r = 'north') AND
      (t_3_S.r = 'north') AND
      (t_3_S.v = t_2_S.v)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Better_MultBodyAggAux.d AS d,
  SUM(Better_MultBodyAggAux.n) AS n
FROM
  t_0_Better_MultBodyAggAux AS Better_MultBodyAggAux
GROUP BY 1;

-- Interacting with table synalog_home.Better

WITH t_1_S AS (SELECT * FROM (
  
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
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      S.d AS d,
      S.v AS v
    FROM
      t_1_S AS S
    WHERE
      NOT (S.d IS NOT NULL AND CAST(S.d AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        Better.d AS synalog_k0
      FROM
        synalog_home.Better AS Better
      GROUP BY 1) AS synalog_m)) AND
      (S.r = 'north')
   UNION ALL
  
    SELECT
      t_2_S.d AS d,
      t_2_S.v AS v
    FROM
      t_1_S AS t_2_S, synalog_home.Better AS t_3_Better
    WHERE
      (t_3_Better.n < 2) AND
      (t_2_S.r = 'north') AND
      (t_3_Better.d = t_2_S.d)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.d AS d,
  Q_MultBodyAggAux.v AS v
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1, 2 ORDER BY d, v;