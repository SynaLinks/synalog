-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_3_Follows AS (SELECT * FROM (
  
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
t_2_User_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Follows.a AS u
    FROM
      t_3_Follows AS Follows
   UNION ALL
  
    SELECT
      t_4_Follows.b AS u
    FROM
      t_3_Follows AS t_4_Follows
  
) AS UNUSED_TABLE_NAME  ),
t_1_User AS (SELECT
  User_MultBodyAggAux.u AS u
FROM
  t_2_User_MultBodyAggAux AS User_MultBodyAggAux
GROUP BY 1),
t_5_Followed AS (SELECT
  t_6_Follows.b AS u
FROM
  t_3_Follows AS t_6_Follows
GROUP BY 1)
SELECT
  t_0_User.u AS u
FROM
  t_1_User AS t_0_User
WHERE
  NOT (t_0_User.u IS NOT NULL AND CAST(t_0_User.u AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Followed.u AS synalog_k0
  FROM
    t_5_Followed AS Followed
  GROUP BY 1) AS synalog_m));