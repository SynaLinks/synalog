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
  x_8 AS col0,
  CASE WHEN (x_8 < 3) THEN ((x_8) * (2)) WHEN (x_8 < 6) THEN ((x_8) + (10)) ELSE ((((x_8) * (x_8))) - (20)) END AS col1
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_8 ORDER BY col0;