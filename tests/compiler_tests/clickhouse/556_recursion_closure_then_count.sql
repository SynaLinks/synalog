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

DROP TABLE IF EXISTS synalog_home.P_sn_delta;
CREATE TABLE synalog_home.P_sn_delta ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_0_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table synalog_home.P_sn_delta

DROP TABLE IF EXISTS synalog_home.P_sn_t0;
CREATE TABLE synalog_home.P_sn_t0 ENGINE = Memory AS SELECT
  P_sn_delta.a AS a,
  P_sn_delta.b AS b
FROM
  synalog_home.P_sn_delta AS P_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_home.P_sn_t0

DROP TABLE IF EXISTS synalog_home.P_sn_t1;
CREATE TABLE synalog_home.P_sn_t1 ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_t0.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_t0 AS P_sn_t0, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_t0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r1 AS (SELECT
  P_MultBodyAggAux_f3.a AS a,
  P_MultBodyAggAux_f3.b AS b
FROM
  t_1_P_MultBodyAggAux_f3 AS P_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  P_sn_r1.a AS a,
  P_sn_r1.b AS b
FROM
  t_0_P_sn_r1 AS P_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_home.P_sn_t1

DROP TABLE IF EXISTS synalog_home.P_sn_t2;
CREATE TABLE synalog_home.P_sn_t2 ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_t1.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_t1 AS P_sn_t1, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_t1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r2 AS (SELECT
  P_MultBodyAggAux_f4.a AS a,
  P_MultBodyAggAux_f4.b AS b
FROM
  t_1_P_MultBodyAggAux_f4 AS P_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  P_sn_r2.a AS a,
  P_sn_r2.b AS b
FROM
  t_0_P_sn_r2 AS P_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_home.P_sn_t2

DROP TABLE IF EXISTS synalog_home.P_sn_t3;
CREATE TABLE synalog_home.P_sn_t3 ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_t2.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_t2 AS P_sn_t2, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_t2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r3 AS (SELECT
  P_MultBodyAggAux_f5.a AS a,
  P_MultBodyAggAux_f5.b AS b
FROM
  t_1_P_MultBodyAggAux_f5 AS P_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  P_sn_r3.a AS a,
  P_sn_r3.b AS b
FROM
  t_0_P_sn_r3 AS P_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_home.P_sn_t3

DROP TABLE IF EXISTS synalog_home.P_sn_t4;
CREATE TABLE synalog_home.P_sn_t4 ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_t3.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_t3 AS P_sn_t3, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_t3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r4 AS (SELECT
  P_MultBodyAggAux_f6.a AS a,
  P_MultBodyAggAux_f6.b AS b
FROM
  t_1_P_MultBodyAggAux_f6 AS P_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  P_sn_r4.a AS a,
  P_sn_r4.b AS b
FROM
  t_0_P_sn_r4 AS P_sn_r4
WHERE
  (1 = 0);

-- Interacting with table synalog_home.P_sn_t4

DROP TABLE IF EXISTS synalog_home.P_sn_t5;
CREATE TABLE synalog_home.P_sn_t5 ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_t4.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_t4 AS P_sn_t4, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_t4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r5 AS (SELECT
  P_MultBodyAggAux_f7.a AS a,
  P_MultBodyAggAux_f7.b AS b
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  P_sn_r5.a AS a,
  P_sn_r5.b AS b
FROM
  t_0_P_sn_r5 AS P_sn_r5
WHERE
  (1 = 0);

-- Interacting with table synalog_home.P_sn_t5

DROP TABLE IF EXISTS synalog_home.P_sn_full;
CREATE TABLE synalog_home.P_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      P_sn_delta.a AS a,
      P_sn_delta.b AS b
    FROM
      synalog_home.P_sn_delta AS P_sn_delta
   UNION ALL
  
    SELECT
      P_sn_t1.a AS a,
      P_sn_t1.b AS b
    FROM
      synalog_home.P_sn_t1 AS P_sn_t1
   UNION ALL
  
    SELECT
      P_sn_t2.a AS a,
      P_sn_t2.b AS b
    FROM
      synalog_home.P_sn_t2 AS P_sn_t2
   UNION ALL
  
    SELECT
      P_sn_t3.a AS a,
      P_sn_t3.b AS b
    FROM
      synalog_home.P_sn_t3 AS P_sn_t3
   UNION ALL
  
    SELECT
      P_sn_t4.a AS a,
      P_sn_t4.b AS b
    FROM
      synalog_home.P_sn_t4 AS P_sn_t4
   UNION ALL
  
    SELECT
      P_sn_t5.a AS a,
      P_sn_t5.b AS b
    FROM
      synalog_home.P_sn_t5 AS P_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.P_sn_full

DROP TABLE IF EXISTS synalog_home.P_sn_new;
CREATE TABLE synalog_home.P_sn_new ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_delta AS P_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.a AS a,
  P_MultBodyAggAux_f8.b AS b
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  NOT ((CAST(P_sn_step.a AS Nullable(String)), CAST(P_sn_step.b AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    P_sn_full.a AS synalog_k0,
    P_sn_full.b AS synalog_k1
  FROM
    synalog_home.P_sn_full AS P_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.P_sn_full SELECT * FROM synalog_home.P_sn_new;

DROP TABLE IF EXISTS synalog_home.P_sn_delta;
CREATE TABLE synalog_home.P_sn_delta ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_new AS P_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_back_step AS (SELECT
  P_MultBodyAggAux_f1.a AS a,
  P_MultBodyAggAux_f1.b AS b
FROM
  t_1_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  P_sn_back_step.a AS a,
  P_sn_back_step.b AS b
FROM
  t_0_P_sn_back_step AS P_sn_back_step
WHERE
  NOT ((CAST(P_sn_back_step.a AS Nullable(String)), CAST(P_sn_back_step.b AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    P_sn_full.a AS synalog_k0,
    P_sn_full.b AS synalog_k1
  FROM
    synalog_home.P_sn_full AS P_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.P_sn_full SELECT * FROM synalog_home.P_sn_delta;

DROP TABLE IF EXISTS synalog_home.P_sn_new;
CREATE TABLE synalog_home.P_sn_new ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_delta AS P_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.a AS a,
  P_MultBodyAggAux_f8.b AS b
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  NOT ((CAST(P_sn_step.a AS Nullable(String)), CAST(P_sn_step.b AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    P_sn_full.a AS synalog_k0,
    P_sn_full.b AS synalog_k1
  FROM
    synalog_home.P_sn_full AS P_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.P_sn_full SELECT * FROM synalog_home.P_sn_new;

DROP TABLE IF EXISTS synalog_home.P_sn_delta;
CREATE TABLE synalog_home.P_sn_delta ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_new AS P_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_back_step AS (SELECT
  P_MultBodyAggAux_f1.a AS a,
  P_MultBodyAggAux_f1.b AS b
FROM
  t_1_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  P_sn_back_step.a AS a,
  P_sn_back_step.b AS b
FROM
  t_0_P_sn_back_step AS P_sn_back_step
WHERE
  NOT ((CAST(P_sn_back_step.a AS Nullable(String)), CAST(P_sn_back_step.b AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    P_sn_full.a AS synalog_k0,
    P_sn_full.b AS synalog_k1
  FROM
    synalog_home.P_sn_full AS P_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.P_sn_full SELECT * FROM synalog_home.P_sn_delta;

DROP TABLE IF EXISTS synalog_home.P_sn_new;
CREATE TABLE synalog_home.P_sn_new ENGINE = Memory AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      P_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_home.P_sn_delta AS P_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.a AS a,
  P_MultBodyAggAux_f8.b AS b
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  NOT ((CAST(P_sn_step.a AS Nullable(String)), CAST(P_sn_step.b AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    P_sn_full.a AS synalog_k0,
    P_sn_full.b AS synalog_k1
  FROM
    synalog_home.P_sn_full AS P_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.P_sn_full SELECT * FROM synalog_home.P_sn_new;

SELECT
  SUM(1) AS n
FROM
  synalog_home.P_sn_full AS P_sn_full;