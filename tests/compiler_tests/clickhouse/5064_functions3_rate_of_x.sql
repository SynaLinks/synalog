-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Rate AS (SELECT * FROM (
  
    SELECT
      'ab' AS s,
      2 AS r
   UNION ALL
  
    SELECT
      'hello' AS s,
      5 AS r
   UNION ALL
  
    SELECT
      'x' AS s,
      10 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Rate.r AS v
FROM
  t_0_Rate AS Rate
WHERE
  ('x' = Rate.s);