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
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_9
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table synalog_home.Reach_sn_delta

DROP TABLE IF EXISTS synalog_home.Reach_sn_t0;
CREATE TABLE synalog_home.Reach_sn_t0 ENGINE = Memory AS SELECT
  Reach_sn_delta.x AS x,
  Reach_sn_delta.y AS y
FROM
  synalog_home.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t0

DROP TABLE IF EXISTS synalog_home.Reach_sn_t1;
CREATE TABLE synalog_home.Reach_sn_t1 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_13
   UNION ALL
  
    SELECT
      Reach_sn_t0.x AS x,
      ((x_21) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t0 AS Reach_sn_t0
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_21
    WHERE
      (Reach_sn_t0.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_r1.x AS x,
  Reach_sn_r1.y AS y
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t1

DROP TABLE IF EXISTS synalog_home.Reach_sn_t2;
CREATE TABLE synalog_home.Reach_sn_t2 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_13
   UNION ALL
  
    SELECT
      Reach_sn_t1.x AS x,
      ((x_21) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t1 AS Reach_sn_t1
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_21
    WHERE
      (Reach_sn_t1.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Reach_sn_r2.x AS x,
  Reach_sn_r2.y AS y
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t2

DROP TABLE IF EXISTS synalog_home.Reach_sn_t3;
CREATE TABLE synalog_home.Reach_sn_t3 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_13
   UNION ALL
  
    SELECT
      Reach_sn_t2.x AS x,
      ((x_21) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t2 AS Reach_sn_t2
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_21
    WHERE
      (Reach_sn_t2.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Reach_sn_r3.x AS x,
  Reach_sn_r3.y AS y
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t3

DROP TABLE IF EXISTS synalog_home.Reach_sn_t4;
CREATE TABLE synalog_home.Reach_sn_t4 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_13
   UNION ALL
  
    SELECT
      Reach_sn_t3.x AS x,
      ((x_21) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t3 AS Reach_sn_t3
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_21
    WHERE
      (Reach_sn_t3.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r4 AS (SELECT
  Reach_MultBodyAggAux_f6.x AS x,
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Reach_sn_r4.x AS x,
  Reach_sn_r4.y AS y
FROM
  t_0_Reach_sn_r4 AS Reach_sn_r4
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t4

DROP TABLE IF EXISTS synalog_home.Reach_sn_t5;
CREATE TABLE synalog_home.Reach_sn_t5 ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_13
   UNION ALL
  
    SELECT
      Reach_sn_t4.x AS x,
      ((x_21) + (1)) AS y
    FROM
      synalog_home.Reach_sn_t4 AS Reach_sn_t4
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_21
    WHERE
      (Reach_sn_t4.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r5 AS (SELECT
  Reach_MultBodyAggAux_f7.x AS x,
  Reach_MultBodyAggAux_f7.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Reach_sn_r5.x AS x,
  Reach_sn_r5.y AS y
FROM
  t_0_Reach_sn_r5 AS Reach_sn_r5
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Reach_sn_t5

DROP TABLE IF EXISTS synalog_home.Reach_sn_full;
CREATE TABLE synalog_home.Reach_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta.x AS x,
      Reach_sn_delta.y AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1.x AS x,
      Reach_sn_t1.y AS y
    FROM
      synalog_home.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2.x AS x,
      Reach_sn_t2.y AS y
    FROM
      synalog_home.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3.x AS x,
      Reach_sn_t3.y AS y
    FROM
      synalog_home.Reach_sn_t3 AS Reach_sn_t3
   UNION ALL
  
    SELECT
      Reach_sn_t4.x AS x,
      Reach_sn_t4.y AS y
    FROM
      synalog_home.Reach_sn_t4 AS Reach_sn_t4
   UNION ALL
  
    SELECT
      Reach_sn_t5.x AS x,
      Reach_sn_t5.y AS y
    FROM
      synalog_home.Reach_sn_t5 AS Reach_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.Reach_sn_full

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

DROP TABLE IF EXISTS synalog_home.Reach_sn_delta;
CREATE TABLE synalog_home.Reach_sn_delta ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_new.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_new AS Reach_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_new.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.x AS x,
  Reach_sn_back_step.y AS y
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  NOT ((CAST(Reach_sn_back_step.x AS Nullable(String)), CAST(Reach_sn_back_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_delta;

DROP TABLE IF EXISTS synalog_home.Reach_sn_new;
CREATE TABLE synalog_home.Reach_sn_new ENGINE = Memory AS WITH t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) + (1)) AS y
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_15
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_23) + (1)) AS y
    FROM
      synalog_home.Reach_sn_delta AS Reach_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(4, 0)))) AS x_23
    WHERE
      (Reach_sn_delta.y = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.x AS x,
  Reach_MultBodyAggAux_f8.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  NOT ((CAST(Reach_sn_step.x AS Nullable(String)), CAST(Reach_sn_step.y AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Reach_sn_full.x AS synalog_k0,
    Reach_sn_full.y AS synalog_k1
  FROM
    synalog_home.Reach_sn_full AS Reach_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Reach_sn_full SELECT * FROM synalog_home.Reach_sn_new;

SELECT
  SUM(1) AS n
FROM
  synalog_home.Reach_sn_full AS Reach_sn_full;