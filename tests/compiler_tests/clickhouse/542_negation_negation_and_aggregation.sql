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
  SUM(x_2) AS t
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN [1, 2, 3] AS x_2
WHERE
  NOT (x_2 IS NOT NULL AND CAST(x_2 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    2 AS synalog_k0
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  GROUP BY 1) AS synalog_m));