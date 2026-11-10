-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_U AS (SELECT * FROM (
  
    SELECT
      'ann' AS u,
      31 AS age
   UNION ALL
  
    SELECT
      'bob' AS u,
      25 AS age
   UNION ALL
  
    SELECT
      'cid' AS u,
      40 AS age
   UNION ALL
  
    SELECT
      'dee' AS u,
      19 AS age
   UNION ALL
  
    SELECT
      'eve' AS u,
      52 AS age
   UNION ALL
  
    SELECT
      'fay' AS u,
      28 AS age
   UNION ALL
  
    SELECT
      'gus' AS u,
      35 AS age
  
) AS UNUSED_TABLE_NAME  ),
t_4_F AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'cid' AS a,
      'dee' AS b
   UNION ALL
  
    SELECT
      'dee' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'fay' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cid' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_U.u AS a,
  t_1_U.u AS b
FROM
  t_2_U AS t_0_U, t_2_U AS t_1_U
WHERE
  (t_0_U.u < t_1_U.u) AND
  NOT (t_0_U.u IS NOT NULL AND t_1_U.u IS NOT NULL AND (CAST(t_0_U.u AS Nullable(String)), CAST(t_1_U.u AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    F.a AS synalog_k0,
    t_3_F.a AS synalog_k1
  FROM
    t_4_F AS F, t_4_F AS t_3_F
  WHERE
    (t_3_F.b = F.b)
  GROUP BY 1, 2) AS synalog_m)) ORDER BY a, b;