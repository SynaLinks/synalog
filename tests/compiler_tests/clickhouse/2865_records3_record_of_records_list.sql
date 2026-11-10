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
  tupleElement(tupleElement(x_1, 'p'), 'n') AS n,
  tupleElement(tupleElement(x_1, 'p'), 'v') AS v
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [CAST(tuple(CAST(tuple('x', 1) AS Tuple(n Nullable(String), v Nullable(Float64)))) AS Tuple(p Tuple(n Nullable(String), v Nullable(Float64)))), CAST(tuple(CAST(tuple('y', 2) AS Tuple(n Nullable(String), v Nullable(Float64)))) AS Tuple(p Tuple(n Nullable(String), v Nullable(Float64))))] AS x_1 ORDER BY n;