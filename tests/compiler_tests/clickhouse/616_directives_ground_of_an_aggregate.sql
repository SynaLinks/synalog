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

DROP TABLE IF EXISTS synalog_home.T;
CREATE TABLE synalog_home.T ENGINE = Memory AS SELECT
  SUM(x_2) AS t
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2] AS x_2;

-- Interacting with table synalog_home.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  synalog_home.T AS t_0_T, synalog_home.T AS t_1_T;