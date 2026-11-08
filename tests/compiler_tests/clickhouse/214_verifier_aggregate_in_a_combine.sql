-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Total AS (SELECT
  SUM(x_8) AS t
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 3] AS x_8)
SELECT
  x_5 AS x,
  (CAST(x_5 AS Nullable(Float64)) / NULLIF(CAST(Total.t AS Nullable(Float64)), 0)) AS s
FROM
  t_0_Total AS Total
  ARRAY JOIN [1, 3] AS x_5 ORDER BY x;