-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'b' AS s,
      true AS b
   UNION ALL
  
    SELECT
      2 AS k,
      null AS x,
      'a' AS s,
      false AS b
   UNION ALL
  
    SELECT
      3 AS k,
      2 AS x,
      null AS s,
      true AS b
   UNION ALL
  
    SELECT
      4 AS k,
      5 AS x,
      'c' AS s,
      null AS b
   UNION ALL
  
    SELECT
      5 AS k,
      -1 AS x,
      'B' AS s,
      false AS b
   UNION ALL
  
    SELECT
      6 AS k,
      2 AS x,
      'a' AS s,
      true AS b
   UNION ALL
  
    SELECT
      7 AS k,
      null AS x,
      null AS s,
      false AS b
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x,
      'aa' AS s,
      true AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k
FROM
  t_0_R AS R ORDER BY k desc LIMIT 5;