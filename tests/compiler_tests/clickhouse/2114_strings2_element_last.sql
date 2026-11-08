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
  (CASE WHEN ((length(splitByString(',', ifNull('a,b,c', '')))) - (1)) < 0 OR ((length(splitByString(',', ifNull('a,b,c', '')))) - (1)) >= length(splitByString(',', ifNull('a,b,c', ''))) THEN NULL ELSE arrayElement(splitByString(',', ifNull('a,b,c', '')), toInt64(((length(splitByString(',', ifNull('a,b,c', '')))) - (1))) + 1) END) AS s;