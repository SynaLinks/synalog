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
      'b' AS s,
      3 AS n
   UNION ALL
  
    SELECT
      'a' AS s,
      1 AS n
   UNION ALL
  
    SELECT
      'a' AS s,
      2 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.s AS s,
  V.n AS n
FROM
  t_0_V AS V ORDER BY s, n desc;