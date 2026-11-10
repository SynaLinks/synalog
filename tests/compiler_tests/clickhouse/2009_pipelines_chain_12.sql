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
  x_27 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2, 3, 4, 5, 6, 7, 8] AS x_27
WHERE
  (x_27 != 12) AND
  (x_27 != 11) AND
  (x_27 != 10) AND
  (x_27 != 9) AND
  (x_27 != 8) AND
  (x_27 != 7) AND
  (x_27 != 6) AND
  (x_27 != 5) AND
  (x_27 != 4) AND
  (x_27 != 3) AND
  (x_27 != 2) AND
  (x_27 != 1);