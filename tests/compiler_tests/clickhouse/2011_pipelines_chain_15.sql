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
  x_33 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2, 3, 4, 5, 6, 7, 8] AS x_33
WHERE
  (x_33 != 15) AND
  (x_33 != 14) AND
  (x_33 != 13) AND
  (x_33 != 12) AND
  (x_33 != 11) AND
  (x_33 != 10) AND
  (x_33 != 9) AND
  (x_33 != 8) AND
  (x_33 != 7) AND
  (x_33 != 6) AND
  (x_33 != 5) AND
  (x_33 != 4) AND
  (x_33 != 3) AND
  (x_33 != 2) AND
  (x_33 != 1);