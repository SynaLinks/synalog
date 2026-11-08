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
      'a' AS k,
      [1, 2, 3] AS l
   UNION ALL
  
    SELECT
      'b' AS k,
      [10] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  SUM(x_3) AS t
FROM
  t_1_L AS t_0_L
  ARRAY JOIN t_0_L.l AS x_3
GROUP BY 1 ORDER BY k, t;