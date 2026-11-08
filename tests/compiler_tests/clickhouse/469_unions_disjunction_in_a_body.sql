-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS x,
      'b' AS s
   UNION ALL
  
    SELECT
      3 AS x,
      'c' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (1 = N.x)
   UNION ALL
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (2 = N.x)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;