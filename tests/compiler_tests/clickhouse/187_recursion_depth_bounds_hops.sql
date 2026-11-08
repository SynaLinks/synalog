-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;
CREATE DATABASE IF NOT EXISTS synalog_test;

DROP TABLE IF EXISTS synalog_test.Reach_sn_delta;
CREATE TABLE synalog_test.Reach_sn_delta ENGINE = Memory AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table synalog_test.Reach_sn_delta

DROP TABLE IF EXISTS synalog_test.Reach_sn_t0;
CREATE TABLE synalog_test.Reach_sn_t0 ENGINE = Memory AS SELECT
  Reach_sn_delta.x AS x
FROM
  synalog_test.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_test.Reach_sn_t0

DROP TABLE IF EXISTS synalog_test.Reach_sn_t1;
CREATE TABLE synalog_test.Reach_sn_t1 ENGINE = Memory AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      synalog_test.Reach_sn_t0 AS Reach_sn_t0, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_t0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  Reach_sn_r1.x AS x
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_test.Reach_sn_t1

DROP TABLE IF EXISTS synalog_test.Reach_sn_t2;
CREATE TABLE synalog_test.Reach_sn_t2 ENGINE = Memory AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      synalog_test.Reach_sn_t1 AS Reach_sn_t1, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_t1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  Reach_sn_r2.x AS x
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_test.Reach_sn_t2

DROP TABLE IF EXISTS synalog_test.Reach_sn_t3;
CREATE TABLE synalog_test.Reach_sn_t3 ENGINE = Memory AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      synalog_test.Reach_sn_t2 AS Reach_sn_t2, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_t2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_r3.x AS x
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_test.Reach_sn_t3

DROP TABLE IF EXISTS synalog_test.Reach_sn_full;
CREATE TABLE synalog_test.Reach_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta.x AS x
    FROM
      synalog_test.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1.x AS x
    FROM
      synalog_test.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2.x AS x
    FROM
      synalog_test.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3.x AS x
    FROM
      synalog_test.Reach_sn_t3 AS Reach_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_test.Reach_sn_full

DROP TABLE IF EXISTS synalog_test.Reach_sn_new;
CREATE TABLE synalog_test.Reach_sn_new ENGINE = Memory AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      synalog_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0
  FROM
    synalog_test.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_test.Reach_sn_full SELECT * FROM synalog_test.Reach_sn_new;

DROP TABLE IF EXISTS synalog_test.Reach_sn_delta;
CREATE TABLE synalog_test.Reach_sn_delta ENGINE = Memory AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      synalog_test.Reach_sn_new AS Reach_sn_new, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_new.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.x AS x
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0
  FROM
    synalog_test.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_test.Reach_sn_full SELECT * FROM synalog_test.Reach_sn_delta;

SELECT
  Reach_sn_full.x AS x
FROM
  synalog_test.Reach_sn_full AS Reach_sn_full ORDER BY x;