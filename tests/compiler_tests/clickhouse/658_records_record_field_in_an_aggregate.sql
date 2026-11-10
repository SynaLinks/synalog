-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(tuple(2) AS Tuple(a Nullable(Float64))) AS r
   UNION ALL
  
    SELECT
      CAST(tuple(3) AS Tuple(a Nullable(Float64))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(tupleElement(V.r, 'a')) AS t
FROM
  t_0_V AS V;