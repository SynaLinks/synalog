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
  (CASE WHEN CAST('1' AS Nullable(Int64)) < 0 OR CAST('1' AS Nullable(Int64)) >= length([10, 20, 30]) THEN NULL ELSE arrayElement([10, 20, 30], toInt64(CAST('1' AS Nullable(Int64))) + 1) END) AS e,
  (CASE WHEN CAST(sign(1.0) * floor(abs(1.0) + 0.5) AS Nullable(Int64)) < 0 OR CAST(sign(1.0) * floor(abs(1.0) + 0.5) AS Nullable(Int64)) >= length(['a', 'b']) THEN NULL ELSE arrayElement(['a', 'b'], toInt64(CAST(sign(1.0) * floor(abs(1.0) + 0.5) AS Nullable(Int64))) + 1) END) AS f,
  (CASE WHEN CAST(5 AS Nullable(Int64)) < 0 OR CAST(5 AS Nullable(Int64)) >= length([1]) THEN NULL ELSE arrayElement([1], toInt64(CAST(5 AS Nullable(Int64))) + 1) END) AS g;