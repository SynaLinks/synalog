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
  x_3 AS d,
  CAST(substringUTF8(x_3, 9, 2) AS Nullable(Int64)) AS p
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN ['2024-03-09', '2023-11-30', '2024-01-15'] AS x_3 ORDER BY d;