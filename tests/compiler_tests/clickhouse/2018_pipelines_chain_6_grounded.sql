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

DROP TABLE IF EXISTS synalog_home.C0;
CREATE TABLE synalog_home.C0 ENGINE = Memory AS SELECT
  x_1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2, 3, 4, 5, 6, 7, 8] AS x_1;

-- Interacting with table synalog_home.C0

DROP TABLE IF EXISTS synalog_home.C3;
CREATE TABLE synalog_home.C3 ENGINE = Memory AS SELECT
  C0.x AS x
FROM
  synalog_home.C0 AS C0
WHERE
  (C0.x != 3) AND
  (C0.x != 2) AND
  (C0.x != 1);

-- Interacting with table synalog_home.C3

DROP TABLE IF EXISTS synalog_home.C6;
CREATE TABLE synalog_home.C6 ENGINE = Memory AS SELECT
  C3.x AS x
FROM
  synalog_home.C3 AS C3
WHERE
  (C3.x != 6) AND
  (C3.x != 5) AND
  (C3.x != 4);

-- Interacting with table synalog_home.C6

SELECT
  C6.x AS x
FROM
  synalog_home.C6 AS C6 ORDER BY x;