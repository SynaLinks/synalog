-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

SELECT * FROM (
  
    SELECT
      'rome' AS name,
      1 AS n
   UNION ALL
  
    SELECT
      'paris' AS name,
      2 AS n
   UNION ALL
  
    SELECT
      'oslo' AS name,
      10 AS n
  
) AS UNUSED_TABLE_NAME  ORDER BY name ;