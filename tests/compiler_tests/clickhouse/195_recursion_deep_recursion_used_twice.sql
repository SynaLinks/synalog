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

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table synalog_home.Reach_sn_delta

DROP TABLE IF EXISTS synalog_home.Reach_sn_t0;
CREATE TABLE synalog_home.Reach_sn_t0 ENGINE = Memory AS SELECT
  Reach_sn_delta.y AS y
FROM
  synalog_home.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t0

DROP TABLE IF EXISTS synalog_home.Reach_sn_t1;
CREATE TABLE synalog_home.Reach_sn_t1 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t0 AS Reach_sn_t0
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (Reach_sn_t0.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  Reach_sn_r1.y AS y
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t1

DROP TABLE IF EXISTS synalog_home.Reach_sn_t2;
CREATE TABLE synalog_home.Reach_sn_t2 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t1 AS Reach_sn_t1
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (Reach_sn_t1.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  Reach_sn_r2.y AS y
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t2

DROP TABLE IF EXISTS synalog_home.Reach_sn_t3;
CREATE TABLE synalog_home.Reach_sn_t3 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t2 AS Reach_sn_t2
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (Reach_sn_t2.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_r3.y AS y
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t3

DROP TABLE IF EXISTS synalog_home.Reach_sn_full;
CREATE TABLE synalog_home.Reach_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta.y AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1.y AS y
    FROM
      synalog_home.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2.y AS y
    FROM
      synalog_home.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3.y AS y
    FROM
      synalog_home.Reach_sn_t3 AS Reach_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.Reach_sn_full

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT (CAST(Reach_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (Reach_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT (CAST(Reach_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.y AS synalog_k0
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach;
CREATE TABLE synalog_home.Reach ENGINE = Memory AS SELECT
  Reach_sn_full.y AS y
FROM
  synalog_home.Reach_sn_full AS Reach_sn_full;

-- Interacting with table synalog_home.Reach

WITH t_0_Far AS (SELECT
  MAX(Reach.y) AS m
FROM
  synalog_home.Reach AS Reach),
t_1_Count AS (SELECT
  SUM(1) AS n
FROM
  synalog_home.Reach AS t_2_Reach)
SELECT
  Far.m AS m,
  Count.n AS n
FROM
  t_0_Far AS Far, t_1_Count AS Count;