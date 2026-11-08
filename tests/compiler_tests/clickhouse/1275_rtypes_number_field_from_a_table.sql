-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      100 AS score
   UNION ALL
  
    SELECT
      'b' AS name,
      20 AS score
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  P.score AS score
FROM
  t_1_P AS P ORDER BY score;