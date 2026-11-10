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
      1 AS k,
      CAST(tuple(['a']) AS Tuple(xs Array(Nullable(String)))) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(tuple(CAST([] AS Array(Nullable(String)))) AS Tuple(xs Array(Nullable(String)))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  length(tupleElement(t_0_R.r, 'xs')) AS n
FROM
  t_1_R AS t_0_R ORDER BY k;