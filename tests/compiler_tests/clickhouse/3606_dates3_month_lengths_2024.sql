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
  x_3 AS m,
  CASE WHEN (x_3 = 2) THEN CASE WHEN (((((2024) % NULLIF(4, 0)) = 0) AND (((2024) % NULLIF(100, 0)) != 0)) OR (((2024) % NULLIF(400, 0)) = 0)) THEN 29 ELSE 28 END ELSE (CASE WHEN ((x_3) - (1)) < 0 OR ((x_3) - (1)) >= length([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) THEN NULL ELSE arrayElement([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], toInt64(((x_3) - (1))) + 1) END) END AS n
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(13, 0)))) AS x_3
WHERE
  (x_3 > 0) ORDER BY m;