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
  ((((((((((((((365) * (((((2023) + (1))) - (1970))))) + (((if(4 = 0, NULL, toInt64(trunc(((((2023) + (1))) - (1969)) / if(4 = 0, 1, 4))))) - (if(100 = 0, NULL, toInt64(trunc(((((2023) + (1))) - (1901)) / if(100 = 0, 1, 100))))))))) + (if(400 = 0, NULL, toInt64(trunc(((((2023) + (1))) - (1601)) / if(400 = 0, 1, 400))))))) + (CASE WHEN ((1 > 2) AND (((((((2023) + (1))) % NULLIF(4, 0)) = 0) AND (((((2023) + (1))) % NULLIF(100, 0)) != 0)) OR (((((2023) + (1))) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END))) + ((CASE WHEN ((1) - (1)) < 0 OR ((1) - (1)) >= length([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]) THEN NULL ELSE arrayElement([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], toInt64(((1) - (1))) + 1) END)))) + (((1) - (1))))) - (((((((((((((365) * (((2023) - (1970))))) + (((if(4 = 0, NULL, toInt64(trunc(((2023) - (1969)) / if(4 = 0, 1, 4))))) - (if(100 = 0, NULL, toInt64(trunc(((2023) - (1901)) / if(100 = 0, 1, 100))))))))) + (if(400 = 0, NULL, toInt64(trunc(((2023) - (1601)) / if(400 = 0, 1, 400))))))) + (CASE WHEN ((1 > 2) AND (((((2023) % NULLIF(4, 0)) = 0) AND (((2023) % NULLIF(100, 0)) != 0)) OR (((2023) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END))) + ((CASE WHEN ((1) - (1)) < 0 OR ((1) - (1)) >= length([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]) THEN NULL ELSE arrayElement([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], toInt64(((1) - (1))) + 1) END)))) + (((1) - (1)))))) AS n;