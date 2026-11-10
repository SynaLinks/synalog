-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      1 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_K AS (SELECT
  R.k AS k
FROM
  t_2_R AS R
GROUP BY 1),
t_3_Loud AS (SELECT
  t_4_R.k AS k
FROM
  t_2_R AS t_4_R
WHERE
  (t_4_R.v > 5)
GROUP BY 1)
SELECT
  t_0_K.k AS k
FROM
  t_1_K AS t_0_K
WHERE
  NOT (t_0_K.k IS NOT NULL AND CAST(t_0_K.k AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Loud.k AS synalog_k0
  FROM
    t_3_Loud AS Loud
  GROUP BY 1) AS synalog_m)) ORDER BY k;