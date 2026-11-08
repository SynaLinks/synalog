-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      3 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_S AS (SELECT
  V.g AS g,
  SUM(V.x) AS t
FROM
  t_1_V AS V
GROUP BY 1)
SELECT
  AVG(S.t) AS a
FROM
  t_0_S AS S;