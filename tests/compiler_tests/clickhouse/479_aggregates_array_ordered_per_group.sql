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
      'x' AS g,
      2 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS k,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(t_0_V.k, t_0_V.v)))) AS l
FROM
  t_3_V AS t_0_V
GROUP BY 1 ORDER BY g;