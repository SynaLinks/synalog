-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      A.x AS t
    FROM
      t_2_A AS A
   UNION ALL
  
    SELECT
      'b' AS src,
      B.x AS t
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_0_S AS (SELECT
  S_MultBodyAggAux.src AS src,
  SUM(S_MultBodyAggAux.t) AS t
FROM
  t_1_S_MultBodyAggAux AS S_MultBodyAggAux
GROUP BY 1)
SELECT
  S.src AS src,
  S.t AS t
FROM
  t_0_S AS S ORDER BY src;