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
  (CASE WHEN 5 < 0 OR 5 >= length(arrayMap(x -> toInt64(x), range(toUInt64(greatest(5, 0))))) THEN NULL ELSE arrayElement(arrayMap(x -> toInt64(x), range(toUInt64(greatest(5, 0)))), toInt64(5) + 1) END) AS e;