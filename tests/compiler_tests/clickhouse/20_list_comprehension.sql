-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Squares AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(x_8, ((x_8) * (x_8)))))) AS synalog_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(5, 0)))) AS x_8),
t_4_EvenSquares AS (SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(x_19, ((x_19) * (x_19)))))) AS synalog_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_19
WHERE
  (((x_19) % NULLIF(2, 0)) = 0))
SELECT
  t_0_Squares.synalog_value AS squares,
  EvenSquares.synalog_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_4_EvenSquares AS EvenSquares;