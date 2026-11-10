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
  arrayElement(arrayMap(synalog_v -> (CASE WHEN synalog_v IS NULL OR 3 IS NULL THEN NULL WHEN CAST(synalog_v AS Float64) = 0 THEN CAST(synalog_v AS Float64) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 3 >= 0 THEN (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) * POWER(10, 3) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 3)) / POWER(10, 3) + 0 END), [(7 / NULLIF(3, 0))]), 1) AS a,
  arrayElement(arrayMap(synalog_v -> (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS Float64) = 0 THEN CAST(synalog_v AS Float64) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 2)) / POWER(10, 2) + 0 END), [2.567]), 1) AS b,
  arrayElement(arrayMap(synalog_v -> (CASE WHEN synalog_v IS NULL OR 1 IS NULL THEN NULL WHEN CAST(synalog_v AS Float64) = 0 THEN CAST(synalog_v AS Float64) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 1 >= 0 THEN (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) * POWER(10, 1) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 1)) / POWER(10, 1) + 0 END), [(1 / NULLIF(8, 0))]), 1) AS c;