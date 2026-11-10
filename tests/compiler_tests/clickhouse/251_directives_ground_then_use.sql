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

DROP TABLE IF EXISTS synalog_test.V;
CREATE TABLE synalog_test.V ENGINE = Memory AS SELECT
  x_1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2] AS x_1;

-- Interacting with table synalog_test.V

SELECT
  ((V.x) * (2)) AS y
FROM
  synalog_test.V AS V ORDER BY y;