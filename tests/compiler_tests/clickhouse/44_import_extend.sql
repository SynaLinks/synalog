-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_Values AS (SELECT * FROM (
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Values.a AS a,
  t_0_Values.b AS b,
  ((((t_0_Values.a) * (t_0_Values.a))) + (((t_0_Values.b) * (t_0_Values.b)))) AS result
FROM
  t_2_Values AS t_0_Values ORDER BY a;