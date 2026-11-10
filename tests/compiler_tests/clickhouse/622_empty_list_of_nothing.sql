-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_C AS (SELECT
  arrayMap(t -> t.1, groupArray(tuple(x_3))) AS l
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1] AS x_3
WHERE
  (x_3 > 5))
SELECT
  COALESCE(length(C.l), 0) AS n
FROM
  t_0_C AS C;