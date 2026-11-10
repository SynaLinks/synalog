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
  CAST(sign((5 / NULLIF(2, 0))) * floor(abs((5 / NULLIF(2, 0))) + 0.5) AS Nullable(Int64)) AS a,
  CAST(sign(- (5 / NULLIF(2, 0))) * floor(abs(- (5 / NULLIF(2, 0))) + 0.5) AS Nullable(Int64)) AS b,
  CAST(sign(3.7) * floor(abs(3.7) + 0.5) AS Nullable(Int64)) AS c,
  CAST(sign((9 / NULLIF(4, 0))) * floor(abs((9 / NULLIF(4, 0))) + 0.5) AS Nullable(Int64)) AS d;