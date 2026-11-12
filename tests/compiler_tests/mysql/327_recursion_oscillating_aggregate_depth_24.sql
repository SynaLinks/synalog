-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;
CREATE DATABASE IF NOT EXISTS synalog_home DEFAULT COLLATE utf8mb4_0900_bin;

DROP TABLE IF EXISTS synalog_home.C_ifr0;
CREATE TABLE synalog_home.C_ifr0 AS WITH t_0_C_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f1.n) AS n
FROM
  t_0_C_MultBodyAggAux_f1 AS C_MultBodyAggAux_f1;

-- Interacting with table synalog_home.C_ifr0

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr0.n) + (1)) AS n
    FROM
      synalog_home.C_ifr0 AS C_ifr0
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

-- Interacting with table synalog_home.C_ifr1

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

-- Interacting with table synalog_home.C_ifr2

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

-- Interacting with table synalog_home.C_ifr1

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

DROP TABLE IF EXISTS synalog_home.C_ifr2;
CREATE TABLE synalog_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr1
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

DROP TABLE IF EXISTS synalog_home.C_ifr1;
CREATE TABLE synalog_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      synalog_home.C_ifr2 AS C_ifr2
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

WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      synalog_home.C_ifr1 AS C_ifr3
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