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
   UNION ALL
  
    SELECT
      5 AS k,
      CAST([] AS Array(Nullable(Float64))) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  arrayElement(arrayMap(synalog_a -> if(length(synalog_a) = 0, NULL, arrayElement(synalog_a, 1)), [arrayReverseSort((synalog_x, synalog_k) -> synalog_k, arrayMap(synalog_u0 -> synalog_u0, arrayMap(x -> toInt64(x), range(toUInt64(greatest(length(t_0_L.l), 0))))), arrayMap(synalog_u0 -> (CASE WHEN synalog_u0 < 0 OR synalog_u0 >= length(t_0_L.l) THEN NULL ELSE arrayElement(t_0_L.l, toInt64(synalog_u0) + 1) END), arrayMap(x -> toInt64(x), range(toUInt64(greatest(length(t_0_L.l), 0))))))]), 1) AS v
FROM
  t_1_L AS t_0_L ORDER BY k;