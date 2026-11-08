-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_L AS (SELECT
  arraySort(groupUniqArray(x_3)) AS l
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN ['x', 'y', 'x'] AS x_3)
SELECT
  length(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;