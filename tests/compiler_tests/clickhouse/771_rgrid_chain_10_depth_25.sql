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

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_0_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_0_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table synalog_home.R_sn_delta

DROP TABLE IF EXISTS synalog_home.R_sn_t0;
CREATE TABLE synalog_home.R_sn_t0 ENGINE = Memory AS SELECT
  R_sn_delta.x AS x
FROM
  synalog_home.R_sn_delta AS R_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_home.R_sn_t0

DROP TABLE IF EXISTS synalog_home.R_sn_t1;
CREATE TABLE synalog_home.R_sn_t1 ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS x
    FROM
      synalog_home.R_sn_t0 AS R_sn_t0
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_9
    WHERE
      (R_sn_t0.x = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r1 AS (SELECT
  R_MultBodyAggAux_f3.x AS x
FROM
  t_1_R_MultBodyAggAux_f3 AS R_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  R_sn_r1.x AS x
FROM
  t_0_R_sn_r1 AS R_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_home.R_sn_t1

DROP TABLE IF EXISTS synalog_home.R_sn_t2;
CREATE TABLE synalog_home.R_sn_t2 ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS x
    FROM
      synalog_home.R_sn_t1 AS R_sn_t1
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_9
    WHERE
      (R_sn_t1.x = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r2 AS (SELECT
  R_MultBodyAggAux_f4.x AS x
FROM
  t_1_R_MultBodyAggAux_f4 AS R_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  R_sn_r2.x AS x
FROM
  t_0_R_sn_r2 AS R_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_home.R_sn_t2

DROP TABLE IF EXISTS synalog_home.R_sn_t3;
CREATE TABLE synalog_home.R_sn_t3 ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS x
    FROM
      synalog_home.R_sn_t2 AS R_sn_t2
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_9
    WHERE
      (R_sn_t2.x = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r3 AS (SELECT
  R_MultBodyAggAux_f5.x AS x
FROM
  t_1_R_MultBodyAggAux_f5 AS R_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  R_sn_r3.x AS x
FROM
  t_0_R_sn_r3 AS R_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_home.R_sn_t3

DROP TABLE IF EXISTS synalog_home.R_sn_full;
CREATE TABLE synalog_home.R_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      R_sn_delta.x AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_t1.x AS x
    FROM
      synalog_home.R_sn_t1 AS R_sn_t1
   UNION ALL
  
    SELECT
      R_sn_t2.x AS x
    FROM
      synalog_home.R_sn_t2 AS R_sn_t2
   UNION ALL
  
    SELECT
      R_sn_t3.x AS x
    FROM
      synalog_home.R_sn_t3 AS R_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.R_sn_full

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

DROP TABLE IF EXISTS synalog_home.R_sn_delta;
CREATE TABLE synalog_home.R_sn_delta ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_new AS R_sn_new
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_new.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  NOT (CAST(R_sn_back_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_delta;

DROP TABLE IF EXISTS synalog_home.R_sn_new;
CREATE TABLE synalog_home.R_sn_new ENGINE = Memory AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_10) + (1)) AS x
    FROM
      synalog_home.R_sn_delta AS R_sn_delta
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_10
    WHERE
      (R_sn_delta.x = x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  NOT (CAST(R_sn_step.x AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    R_sn_full.x AS synalog_k0
  FROM
    synalog_home.R_sn_full AS R_sn_full
  GROUP BY 1) AS synalog_m))
GROUP BY 1;

INSERT INTO synalog_home.R_sn_full SELECT * FROM synalog_home.R_sn_new;

SELECT
  R_sn_full.x AS x
FROM
  synalog_home.R_sn_full AS R_sn_full ORDER BY x;