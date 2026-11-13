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
CREATE TABLE synalog_home.C0 ENGINE = MergeTree ORDER BY tuple() AS SELECT
  x_1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2, 3, 4, 5, 6, 7, 8] AS x_1;

-- Interacting with table synalog_home.C0

DROP TABLE IF EXISTS synalog_home.C3;
CREATE TABLE synalog_home.C3 ENGINE = MergeTree ORDER BY tuple() AS SELECT
  C0.x AS x
FROM
  synalog_home.C0 AS C0
WHERE
  (C0.x != 3) AND
  (C0.x != 2) AND
  (C0.x != 1);

-- Interacting with table synalog_home.C3

DROP TABLE IF EXISTS synalog_home.C6;
CREATE TABLE synalog_home.C6 ENGINE = MergeTree ORDER BY tuple() AS SELECT
  C3.x AS x
FROM
  synalog_home.C3 AS C3
WHERE
  (C3.x != 6) AND
  (C3.x != 5) AND
  (C3.x != 4);

-- Interacting with table synalog_home.C6

DROP TABLE IF EXISTS synalog_home.C9;
CREATE TABLE synalog_home.C9 ENGINE = MergeTree ORDER BY tuple() AS SELECT
  C6.x AS x
FROM
  synalog_home.C6 AS C6
WHERE
  (C6.x != 9) AND
  (C6.x != 8) AND
  (C6.x != 7);

-- Interacting with table synalog_home.C9

DROP TABLE IF EXISTS synalog_home.C12;
CREATE TABLE synalog_home.C12 ENGINE = MergeTree ORDER BY tuple() AS SELECT
  C9.x AS x
FROM
  synalog_home.C9 AS C9
WHERE
  (C9.x != 12) AND
  (C9.x != 11) AND
  (C9.x != 10);

-- Interacting with table synalog_home.C12

DROP TABLE IF EXISTS synalog_home.C15;
CREATE TABLE synalog_home.C15 ENGINE = MergeTree ORDER BY tuple() AS SELECT
  C12.x AS x
FROM
  synalog_home.C12 AS C12
WHERE
  (C12.x != 15) AND
  (C12.x != 14) AND
  (C12.x != 13);

-- Interacting with table synalog_home.C15

SELECT
  C15.x AS x
FROM
  synalog_home.C15 AS C15;