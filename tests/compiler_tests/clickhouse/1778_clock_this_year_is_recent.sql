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
  SUM(1) AS n
FROM
  (SELECT toString(toDate(now('UTC'))) AS date) AS Today
WHERE
  (CAST(substringUTF8(Today.date, 1, 4) AS Nullable(Int64)) > 2025);