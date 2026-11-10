-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      CAST([] AS Array(Nullable(Float64))) AS l
   UNION ALL
  
    SELECT
      3 AS k,
      [7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      [5, 5, 9, 1] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (CASE WHEN ((length(t_0_L.l)) - (1)) < 0 OR ((length(t_0_L.l)) - (1)) >= length(t_0_L.l) THEN NULL ELSE arrayElement(t_0_L.l, toInt64(((length(t_0_L.l)) - (1))) + 1) END) AS v
FROM
  t_1_L AS t_0_L ORDER BY k;