-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'c' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(t_0_V.k, t_0_V.v)))) AS l
FROM
  t_3_V AS t_0_V;