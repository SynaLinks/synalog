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
  providers.npi AS npi
FROM
  providers
WHERE
  NOT (providers.npi IS NOT NULL AND providers.scheme IS NOT NULL AND (CAST(providers.npi AS Nullable(String)), CAST(providers.scheme AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    ground_truth.npi AS synalog_k0,
    ground_truth.scheme AS synalog_k1
  FROM
    ground_truth
  GROUP BY 1, 2) AS synalog_m));