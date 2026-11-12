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

DROP TABLE IF EXISTS synalog_home.Path_ifr0;
CREATE TABLE synalog_home.Path_ifr0 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.Path_ifr0

DROP TABLE IF EXISTS synalog_home.Path_ifr1;
CREATE TABLE synalog_home.Path_ifr1 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr0.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr0 AS Path_ifr0
    WHERE
      (Path_ifr0.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.Path_ifr1

DROP TABLE IF EXISTS synalog_home.Path_ifr2;
CREATE TABLE synalog_home.Path_ifr2 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.Path_ifr2

DROP TABLE IF EXISTS synalog_home.Path_ifr1;
CREATE TABLE synalog_home.Path_ifr1 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_home.Path_ifr1

DROP TABLE IF EXISTS synalog_home.Path_ifr2;
CREATE TABLE synalog_home.Path_ifr2 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS synalog_home.Path_ifr1;
CREATE TABLE synalog_home.Path_ifr1 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS synalog_home.Path_ifr2;
CREATE TABLE synalog_home.Path_ifr2 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS synalog_home.Path_ifr1;
CREATE TABLE synalog_home.Path_ifr1 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS synalog_home.Path_ifr2;
CREATE TABLE synalog_home.Path_ifr2 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS synalog_home.Path_ifr1;
CREATE TABLE synalog_home.Path_ifr1 ENGINE = Memory AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr3.a AS a,
      2 AS b
    FROM
      synalog_home.Path_ifr1 AS Path_ifr3
    WHERE
      (Path_ifr3.b = 1)
  
) AS UNUSED_TABLE_NAME  ;