-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_S AS (SELECT
  MIN(x_5) AS lo,
  MAX(x_5) AS hi
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2, 3] AS x_5)
SELECT
  S.lo AS lo,
  S.hi AS hi
FROM
  t_0_S AS S;