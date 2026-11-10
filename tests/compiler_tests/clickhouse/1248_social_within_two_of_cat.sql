-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Follows AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'cat' AS a,
      'dan' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'eve' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'cat' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Follows.b AS b
    FROM
      t_1_Follows AS Follows
    WHERE
      (Follows.b != 'cat') AND
      (Follows.a = 'cat')
   UNION ALL
  
    SELECT
      t_3_Follows.b AS b
    FROM
      t_1_Follows AS t_2_Follows, t_1_Follows AS t_3_Follows
    WHERE
      (t_3_Follows.b != 'cat') AND
      (t_2_Follows.a = 'cat') AND
      (t_3_Follows.a = t_2_Follows.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux.b AS b
FROM
  t_0_R_MultBodyAggAux AS R_MultBodyAggAux
GROUP BY 1 ORDER BY b;