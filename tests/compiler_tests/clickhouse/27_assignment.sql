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

DROP TABLE IF EXISTS synalog_test.Step1;
CREATE TABLE synalog_test.Step1 ENGINE = Memory AS SELECT
  x_4 AS col0,
  ((x_4) + (1)) AS col1
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(5, 0)))) AS x_4;

-- Interacting with table synalog_test.Step1

SELECT
  Step1.col0 AS col0,
  Step1.col1 AS col1
FROM
  synalog_test.Step1 AS Step1 ORDER BY col0;