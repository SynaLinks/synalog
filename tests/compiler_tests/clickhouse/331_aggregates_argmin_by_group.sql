-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      'a' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'x' AS g,
      'b' AS n,
      2 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'c' AS n,
      9 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'd' AS n,
      4 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  argMin(V.n, V.s) AS w
FROM
  t_1_V AS V
GROUP BY 1 ORDER BY g;