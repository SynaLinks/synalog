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

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_0_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_0_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table synalog_home.A_sn_delta

DROP TABLE IF EXISTS synalog_home.A_sn_t0;
CREATE TABLE synalog_home.A_sn_t0 ENGINE = Memory AS SELECT
  A_sn_delta.y AS y
FROM
  synalog_home.A_sn_delta AS A_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_home.A_sn_t0

DROP TABLE IF EXISTS synalog_home.A_sn_t1;
CREATE TABLE synalog_home.A_sn_t1 ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.A_sn_t0 AS A_sn_t0
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (A_sn_t0.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_r1 AS (SELECT
  A_MultBodyAggAux_f3.y AS y
FROM
  t_1_A_MultBodyAggAux_f3 AS A_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  A_sn_r1.y AS y
FROM
  t_0_A_sn_r1 AS A_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_home.A_sn_t1

DROP TABLE IF EXISTS synalog_home.A_sn_t2;
CREATE TABLE synalog_home.A_sn_t2 ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.A_sn_t1 AS A_sn_t1
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (A_sn_t1.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_r2 AS (SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_1_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  A_sn_r2.y AS y
FROM
  t_0_A_sn_r2 AS A_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_home.A_sn_t2

DROP TABLE IF EXISTS synalog_home.A_sn_t3;
CREATE TABLE synalog_home.A_sn_t3 ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.A_sn_t2 AS A_sn_t2
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (A_sn_t2.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_r3 AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  A_sn_r3.y AS y
FROM
  t_0_A_sn_r3 AS A_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_home.A_sn_t3

DROP TABLE IF EXISTS synalog_home.A_sn_full;
CREATE TABLE synalog_home.A_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      A_sn_delta.y AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
   UNION ALL
  
    SELECT
      A_sn_t1.y AS y
    FROM
      synalog_home.A_sn_t1 AS A_sn_t1
   UNION ALL
  
    SELECT
      A_sn_t2.y AS y
    FROM
      synalog_home.A_sn_t2 AS A_sn_t2
   UNION ALL
  
    SELECT
      A_sn_t3.y AS y
    FROM
      synalog_home.A_sn_t3 AS A_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.A_sn_full

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_0_B_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f8.y AS y
FROM
  t_0_B_MultBodyAggAux_f8 AS B_MultBodyAggAux_f8
GROUP BY 1;

-- Interacting with table synalog_home.B_sn_delta

DROP TABLE IF EXISTS synalog_home.B_sn_t0;
CREATE TABLE synalog_home.B_sn_t0 ENGINE = Memory AS SELECT
  B_sn_delta.y AS y
FROM
  synalog_home.B_sn_delta AS B_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_home.B_sn_t0

DROP TABLE IF EXISTS synalog_home.B_sn_t1;
CREATE TABLE synalog_home.B_sn_t1 ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.B_sn_t0 AS B_sn_t0
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (B_sn_t0.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_r1 AS (SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_1_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY 1)
SELECT
  B_sn_r1.y AS y
FROM
  t_0_B_sn_r1 AS B_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_home.B_sn_t1

DROP TABLE IF EXISTS synalog_home.B_sn_t2;
CREATE TABLE synalog_home.B_sn_t2 ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.B_sn_t1 AS B_sn_t1
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (B_sn_t1.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_r2 AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY 1)
SELECT
  B_sn_r2.y AS y
FROM
  t_0_B_sn_r2 AS B_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_home.B_sn_t2

DROP TABLE IF EXISTS synalog_home.B_sn_t3;
CREATE TABLE synalog_home.B_sn_t3 ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f11 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      synalog_home.B_sn_t2 AS B_sn_t2
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_9
    WHERE
      (B_sn_t2.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_r3 AS (SELECT
  B_MultBodyAggAux_f11.y AS y
FROM
  t_1_B_MultBodyAggAux_f11 AS B_MultBodyAggAux_f11
GROUP BY 1)
SELECT
  B_sn_r3.y AS y
FROM
  t_0_B_sn_r3 AS B_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_home.B_sn_t3

DROP TABLE IF EXISTS synalog_home.B_sn_full;
CREATE TABLE synalog_home.B_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      B_sn_delta.y AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
   UNION ALL
  
    SELECT
      B_sn_t1.y AS y
    FROM
      synalog_home.B_sn_t1 AS B_sn_t1
   UNION ALL
  
    SELECT
      B_sn_t2.y AS y
    FROM
      synalog_home.B_sn_t2 AS B_sn_t2
   UNION ALL
  
    SELECT
      B_sn_t3.y AS y
    FROM
      synalog_home.B_sn_t3 AS B_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.B_sn_full

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.A_sn_delta;
CREATE TABLE synalog_home.A_sn_delta ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_new AS A_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_back_step AS (SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_1_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  A_sn_back_step.y AS y
FROM
  t_0_A_sn_back_step AS A_sn_back_step
WHERE
  NOT (CAST(A_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_delta;

DROP TABLE IF EXISTS synalog_home.A_sn_new;
CREATE TABLE synalog_home.A_sn_new ENGINE = Memory AS WITH t_1_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.A_sn_delta AS A_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (A_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_1_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  NOT (CAST(A_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    A_sn_full.y AS synalog_k0
  FROM
    synalog_home.A_sn_full AS A_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.A_sn_full SELECT * FROM synalog_home.A_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

DROP TABLE IF EXISTS synalog_home.B_sn_new;
CREATE TABLE synalog_home.B_sn_new ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_delta AS B_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_delta.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f12.y AS y
FROM
  t_1_B_MultBodyAggAux_f12 AS B_MultBodyAggAux_f12
GROUP BY 1)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  NOT (CAST(B_sn_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_new;

DROP TABLE IF EXISTS synalog_home.B_sn_delta;
CREATE TABLE synalog_home.B_sn_delta ENGINE = Memory AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS y
    FROM
      synalog_home.B_sn_new AS B_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(100, 0)))) AS x_10
    WHERE
      (B_sn_new.y = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_back_step AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY 1)
SELECT
  B_sn_back_step.y AS y
FROM
  t_0_B_sn_back_step AS B_sn_back_step
WHERE
  NOT (CAST(B_sn_back_step.y AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    B_sn_full.y AS synalog_k0
  FROM
    synalog_home.B_sn_full AS B_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.B_sn_full SELECT * FROM synalog_home.B_sn_delta;

SELECT
  MAX(A_sn_full.y) AS a,
  MAX(B_sn_full.y) AS b
FROM
  synalog_home.A_sn_full AS A_sn_full, synalog_home.B_sn_full AS B_sn_full;