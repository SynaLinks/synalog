-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      3 AS k,
      'c' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.k AS k,
  B.v AS v
FROM
  t_0_B AS B
  ARRAY JOIN [1, 2, 3] AS x_6
WHERE
  (B.k > 1) AND
  (B.v != 'c') AND
  (x_6 = B.k);