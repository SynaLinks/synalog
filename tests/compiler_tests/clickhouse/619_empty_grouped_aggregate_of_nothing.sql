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
  x_5 AS g,
  SUM(x_6) AS t
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN ['a'] AS x_5
  ARRAY JOIN [1] AS x_6
WHERE
  (x_6 > 5)
GROUP BY 1 ORDER BY g;