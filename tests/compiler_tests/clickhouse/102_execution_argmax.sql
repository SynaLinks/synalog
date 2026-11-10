-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Score AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      1 AS s
   UNION ALL
  
    SELECT
      'b' AS name,
      5 AS s
   UNION ALL
  
    SELECT
      'c' AS name,
      3 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  argMax(Score.name, Score.s) AS name
FROM
  t_1_Score AS Score;