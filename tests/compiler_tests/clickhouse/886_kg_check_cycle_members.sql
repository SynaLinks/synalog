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

DROP TABLE IF EXISTS synalog_home.Anc_sn_delta;
CREATE TABLE synalog_home.Anc_sn_delta ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_1_ParentOf.parent_id AS a,
      t_1_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_1_ParentOf
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_0_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table synalog_home.Anc_sn_delta

DROP TABLE IF EXISTS synalog_home.Anc_sn_t0;
CREATE TABLE synalog_home.Anc_sn_t0 ENGINE = Memory AS SELECT
  Anc_sn_delta.a AS a,
  Anc_sn_delta.d AS d
FROM
  synalog_home.Anc_sn_delta AS Anc_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Anc_sn_t0

DROP TABLE IF EXISTS synalog_home.Anc_sn_t1;
CREATE TABLE synalog_home.Anc_sn_t1 ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_t0.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_t0 AS Anc_sn_t0, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_t0.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_r1 AS (SELECT
  Anc_MultBodyAggAux_f3.a AS a,
  Anc_MultBodyAggAux_f3.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f3 AS Anc_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Anc_sn_r1.a AS a,
  Anc_sn_r1.d AS d
FROM
  t_0_Anc_sn_r1 AS Anc_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Anc_sn_t1

DROP TABLE IF EXISTS synalog_home.Anc_sn_t2;
CREATE TABLE synalog_home.Anc_sn_t2 ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_t1.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_t1 AS Anc_sn_t1, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_t1.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_r2 AS (SELECT
  Anc_MultBodyAggAux_f4.a AS a,
  Anc_MultBodyAggAux_f4.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f4 AS Anc_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Anc_sn_r2.a AS a,
  Anc_sn_r2.d AS d
FROM
  t_0_Anc_sn_r2 AS Anc_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Anc_sn_t2

DROP TABLE IF EXISTS synalog_home.Anc_sn_t3;
CREATE TABLE synalog_home.Anc_sn_t3 ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_t2.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_t2 AS Anc_sn_t2, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_t2.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_r3 AS (SELECT
  Anc_MultBodyAggAux_f5.a AS a,
  Anc_MultBodyAggAux_f5.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f5 AS Anc_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Anc_sn_r3.a AS a,
  Anc_sn_r3.d AS d
FROM
  t_0_Anc_sn_r3 AS Anc_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Anc_sn_t3

DROP TABLE IF EXISTS synalog_home.Anc_sn_t4;
CREATE TABLE synalog_home.Anc_sn_t4 ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_t3.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_t3 AS Anc_sn_t3, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_t3.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_r4 AS (SELECT
  Anc_MultBodyAggAux_f6.a AS a,
  Anc_MultBodyAggAux_f6.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f6 AS Anc_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Anc_sn_r4.a AS a,
  Anc_sn_r4.d AS d
FROM
  t_0_Anc_sn_r4 AS Anc_sn_r4
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Anc_sn_t4

DROP TABLE IF EXISTS synalog_home.Anc_sn_t5;
CREATE TABLE synalog_home.Anc_sn_t5 ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_t4.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_t4 AS Anc_sn_t4, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_t4.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_r5 AS (SELECT
  Anc_MultBodyAggAux_f7.a AS a,
  Anc_MultBodyAggAux_f7.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f7 AS Anc_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Anc_sn_r5.a AS a,
  Anc_sn_r5.d AS d
FROM
  t_0_Anc_sn_r5 AS Anc_sn_r5
WHERE
  (1 = 0);

-- Interacting with table synalog_home.Anc_sn_t5

DROP TABLE IF EXISTS synalog_home.Anc_sn_full;
CREATE TABLE synalog_home.Anc_sn_full ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      Anc_sn_delta.a AS a,
      Anc_sn_delta.d AS d
    FROM
      synalog_home.Anc_sn_delta AS Anc_sn_delta
   UNION ALL
  
    SELECT
      Anc_sn_t1.a AS a,
      Anc_sn_t1.d AS d
    FROM
      synalog_home.Anc_sn_t1 AS Anc_sn_t1
   UNION ALL
  
    SELECT
      Anc_sn_t2.a AS a,
      Anc_sn_t2.d AS d
    FROM
      synalog_home.Anc_sn_t2 AS Anc_sn_t2
   UNION ALL
  
    SELECT
      Anc_sn_t3.a AS a,
      Anc_sn_t3.d AS d
    FROM
      synalog_home.Anc_sn_t3 AS Anc_sn_t3
   UNION ALL
  
    SELECT
      Anc_sn_t4.a AS a,
      Anc_sn_t4.d AS d
    FROM
      synalog_home.Anc_sn_t4 AS Anc_sn_t4
   UNION ALL
  
    SELECT
      Anc_sn_t5.a AS a,
      Anc_sn_t5.d AS d
    FROM
      synalog_home.Anc_sn_t5 AS Anc_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.Anc_sn_full

DROP TABLE IF EXISTS synalog_home.Anc_sn_new;
CREATE TABLE synalog_home.Anc_sn_new ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_delta AS Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f8.a AS a,
  Anc_MultBodyAggAux_f8.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f8 AS Anc_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  NOT ((CAST(Anc_sn_step.a AS Nullable(String)), CAST(Anc_sn_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_new;

DROP TABLE IF EXISTS synalog_home.Anc_sn_delta;
CREATE TABLE synalog_home.Anc_sn_delta ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_new.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_new AS Anc_sn_new, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_new.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_back_step AS (SELECT
  Anc_MultBodyAggAux_f1.a AS a,
  Anc_MultBodyAggAux_f1.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f1 AS Anc_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Anc_sn_back_step.a AS a,
  Anc_sn_back_step.d AS d
FROM
  t_0_Anc_sn_back_step AS Anc_sn_back_step
WHERE
  NOT ((CAST(Anc_sn_back_step.a AS Nullable(String)), CAST(Anc_sn_back_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_delta;

DROP TABLE IF EXISTS synalog_home.Anc_sn_new;
CREATE TABLE synalog_home.Anc_sn_new ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_delta AS Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f8.a AS a,
  Anc_MultBodyAggAux_f8.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f8 AS Anc_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  NOT ((CAST(Anc_sn_step.a AS Nullable(String)), CAST(Anc_sn_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_new;

DROP TABLE IF EXISTS synalog_home.Anc_sn_delta;
CREATE TABLE synalog_home.Anc_sn_delta ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_new.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_new AS Anc_sn_new, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_new.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_back_step AS (SELECT
  Anc_MultBodyAggAux_f1.a AS a,
  Anc_MultBodyAggAux_f1.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f1 AS Anc_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Anc_sn_back_step.a AS a,
  Anc_sn_back_step.d AS d
FROM
  t_0_Anc_sn_back_step AS Anc_sn_back_step
WHERE
  NOT ((CAST(Anc_sn_back_step.a AS Nullable(String)), CAST(Anc_sn_back_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_delta;

DROP TABLE IF EXISTS synalog_home.Anc_sn_new;
CREATE TABLE synalog_home.Anc_sn_new ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_delta AS Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f8.a AS a,
  Anc_MultBodyAggAux_f8.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f8 AS Anc_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  NOT ((CAST(Anc_sn_step.a AS Nullable(String)), CAST(Anc_sn_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_new;

DROP TABLE IF EXISTS synalog_home.Anc_sn_delta;
CREATE TABLE synalog_home.Anc_sn_delta ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_new.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_new AS Anc_sn_new, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_new.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_back_step AS (SELECT
  Anc_MultBodyAggAux_f1.a AS a,
  Anc_MultBodyAggAux_f1.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f1 AS Anc_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Anc_sn_back_step.a AS a,
  Anc_sn_back_step.d AS d
FROM
  t_0_Anc_sn_back_step AS Anc_sn_back_step
WHERE
  NOT ((CAST(Anc_sn_back_step.a AS Nullable(String)), CAST(Anc_sn_back_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_delta;

DROP TABLE IF EXISTS synalog_home.Anc_sn_new;
CREATE TABLE synalog_home.Anc_sn_new ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_delta AS Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f8.a AS a,
  Anc_MultBodyAggAux_f8.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f8 AS Anc_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  NOT ((CAST(Anc_sn_step.a AS Nullable(String)), CAST(Anc_sn_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_new;

DROP TABLE IF EXISTS synalog_home.Anc_sn_delta;
CREATE TABLE synalog_home.Anc_sn_delta ENGINE = Memory AS WITH t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Anc_sn_new.a AS a,
      ParentOf.child_id AS d
    FROM
      synalog_home.Anc_sn_new AS Anc_sn_new, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_sn_new.d)
   UNION ALL
  
    SELECT
      t_2_ParentOf.parent_id AS a,
      t_2_ParentOf.child_id AS d
    FROM
      t_2_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_back_step AS (SELECT
  Anc_MultBodyAggAux_f1.a AS a,
  Anc_MultBodyAggAux_f1.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f1 AS Anc_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Anc_sn_back_step.a AS a,
  Anc_sn_back_step.d AS d
FROM
  t_0_Anc_sn_back_step AS Anc_sn_back_step
WHERE
  NOT ((CAST(Anc_sn_back_step.a AS Nullable(String)), CAST(Anc_sn_back_step.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    Anc_sn_full.a AS synalog_k0,
    Anc_sn_full.d AS synalog_k1
  FROM
    synalog_home.Anc_sn_full AS Anc_sn_full
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1, 2;

INSERT INTO synalog_home.Anc_sn_full SELECT * FROM synalog_home.Anc_sn_delta;

SELECT
  Anc_sn_full.a AS n
FROM
  synalog_home.Anc_sn_full AS Anc_sn_full
WHERE
  (Anc_sn_full.d = Anc_sn_full.a)
GROUP BY 1 ORDER BY n;