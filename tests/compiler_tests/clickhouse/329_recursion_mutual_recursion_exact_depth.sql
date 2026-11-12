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

DROP TABLE IF EXISTS synalog_home.Even_fr1;
CREATE TABLE synalog_home.Even_fr1 ENGINE = Memory AS WITH t_0_Even_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f4.x AS x
FROM
  t_0_Even_MultBodyAggAux_f4 AS Even_MultBodyAggAux_f4
GROUP BY 1;

-- Interacting with table synalog_home.Even_fr1

DROP TABLE IF EXISTS synalog_home.Odd_fr2;
CREATE TABLE synalog_home.Odd_fr2 ENGINE = Memory AS SELECT
  ((Even_fr1.x) + (1)) AS x
FROM
  synalog_home.Even_fr1 AS Even_fr1
GROUP BY 1;

-- Interacting with table synalog_home.Odd_fr2

DROP TABLE IF EXISTS synalog_home.Even_fr3;
CREATE TABLE synalog_home.Even_fr3 ENGINE = Memory AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr2.x) + (1)) AS x
    FROM
      synalog_home.Odd_fr2 AS Odd_fr2
   UNION ALL
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.x AS x
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY 1;

-- Interacting with table synalog_home.Even_fr3

DROP TABLE IF EXISTS synalog_home.Odd_fr4;
CREATE TABLE synalog_home.Odd_fr4 ENGINE = Memory AS SELECT
  ((Even_fr3.x) + (1)) AS x
FROM
  synalog_home.Even_fr3 AS Even_fr3
GROUP BY 1;

-- Interacting with table synalog_home.Odd_fr4

WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr4.x) + (1)) AS x
    FROM
      synalog_home.Odd_fr4 AS Odd_fr4
   UNION ALL
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.x AS x
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY 1 ORDER BY x;