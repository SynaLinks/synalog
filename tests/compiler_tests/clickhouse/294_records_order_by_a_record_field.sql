-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      CAST(tuple(2) AS Tuple(k Nullable(Float64))) AS r
   UNION ALL
  
    SELECT
      CAST(tuple(1) AS Tuple(k Nullable(Float64))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  tupleElement(t_0_R.r, 'k') AS k
FROM
  t_1_R AS t_0_R ORDER BY k;