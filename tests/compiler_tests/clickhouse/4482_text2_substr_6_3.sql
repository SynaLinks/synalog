-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'Hello' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      ' a ' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      'aaa' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      'hello world' AS s
   UNION ALL
  
    SELECT
      7 AS k,
      'naïve' AS s
   UNION ALL
  
    SELECT
      8 AS k,
      'lol' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  substringUTF8(W.s, 6, 3) AS v
FROM
  t_0_W AS W ORDER BY k;