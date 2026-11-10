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

DROP TABLE IF EXISTS synalog_test.C_ifr0;
CREATE TABLE synalog_test.C_ifr0 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f1.n) AS n
FROM
  t_0_C_MultBodyAggAux_f1 AS C_MultBodyAggAux_f1;

-- Interacting with table synalog_test.C_ifr0

DROP TABLE IF EXISTS synalog_test.C_ifr1;
CREATE TABLE synalog_test.C_ifr1 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr0.n) + (1)) AS n
    FROM
      synalog_test.C_ifr0 AS C_ifr0
    WHERE
      (C_ifr0.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f2.n) AS n
FROM
  t_0_C_MultBodyAggAux_f2 AS C_MultBodyAggAux_f2;

-- Interacting with table synalog_test.C_ifr1

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_test.C_ifr1 AS C_ifr1
    WHERE
      (C_ifr1.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f3.n) AS n
FROM
  t_0_C_MultBodyAggAux_f3 AS C_MultBodyAggAux_f3;

-- Interacting with table synalog_test.C_ifr2

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

-- Interacting with table synalog_test.C_ifr3

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

-- Interacting with table synalog_test.C_ifr2

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS synalog_test.C_ifr3;
CREATE TABLE synalog_test.C_ifr3 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS synalog_test.C_ifr2;
CREATE TABLE synalog_test.C_ifr2 ENGINE = Memory AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_test.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

WITH t_0_C_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr4.n) + (1)) AS n
    FROM
      synalog_test.C_ifr2 AS C_ifr4
    WHERE
      (C_ifr4.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f6.n) AS n
FROM
  t_0_C_MultBodyAggAux_f6 AS C_MultBodyAggAux_f6;