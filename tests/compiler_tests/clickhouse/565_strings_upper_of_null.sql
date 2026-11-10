-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'ab' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  upperUTF8(V.s) AS a,
  lengthUTF8(V.s) AS b,
  substringUTF8(V.s, 1, 1) AS c
FROM
  t_0_V AS V ORDER BY k;