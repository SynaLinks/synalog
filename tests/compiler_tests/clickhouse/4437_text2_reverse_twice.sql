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
      'naïve' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  reverseUTF8(reverseUTF8(W.s)) AS v,
  reverseUTF8(W.s) AS r
FROM
  t_0_W AS W ORDER BY k;