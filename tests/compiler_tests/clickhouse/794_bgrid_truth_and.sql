-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

SELECT
  x_5 AS x,
  x_7 AS y
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [0, 1] AS x_5
  ARRAY JOIN [0, 1] AS x_7
WHERE
  ((x_5 = 1) AND (x_7 = 1)) ORDER BY x, y;