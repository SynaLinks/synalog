-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_C AS (SELECT
  x_4 AS g,
  SUM(1) AS n
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN ['a', 'a', 'a', 'b', 'c', 'c'] AS x_4
GROUP BY 1)
SELECT
  MAX(C.n) AS m
FROM
  t_0_C AS C;