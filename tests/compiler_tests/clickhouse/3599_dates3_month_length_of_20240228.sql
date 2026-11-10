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
  CASE WHEN (CAST(substringUTF8('2024-02-28', 6, 2) AS Nullable(Int64)) = 2) THEN CASE WHEN (((((CAST(substringUTF8('2024-02-28', 1, 4) AS Nullable(Int64))) % NULLIF(4, 0)) = 0) AND (((CAST(substringUTF8('2024-02-28', 1, 4) AS Nullable(Int64))) % NULLIF(100, 0)) != 0)) OR (((CAST(substringUTF8('2024-02-28', 1, 4) AS Nullable(Int64))) % NULLIF(400, 0)) = 0)) THEN 29 ELSE 28 END ELSE (CASE WHEN ((CAST(substringUTF8('2024-02-28', 6, 2) AS Nullable(Int64))) - (1)) < 0 OR ((CAST(substringUTF8('2024-02-28', 6, 2) AS Nullable(Int64))) - (1)) >= length([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) THEN NULL ELSE arrayElement([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], toInt64(((CAST(substringUTF8('2024-02-28', 6, 2) AS Nullable(Int64))) - (1))) + 1) END) END AS n;