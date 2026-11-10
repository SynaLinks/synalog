-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [0, 1] AS x_4
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [2, 3] AS x_6
   UNION ALL
  
    SELECT
      x_8 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [4, 5] AS x_8
   UNION ALL
  
    SELECT
      x_10 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [6, 7] AS x_10
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;