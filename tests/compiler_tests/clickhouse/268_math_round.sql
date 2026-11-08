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
  (sign(2.6) * floor(abs(2.6) + 0.5) + 0) AS a,
  (sign(-2.6) * floor(abs(-2.6) + 0.5) + 0) AS b,
  (sign(2.4) * floor(abs(2.4) + 0.5) + 0) AS c;