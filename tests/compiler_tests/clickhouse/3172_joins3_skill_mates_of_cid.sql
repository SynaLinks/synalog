-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      10 AS dept,
      null AS boss
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      10 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      20 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS name,
      null AS dept,
      2 AS boss
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      30 AS dept,
      3 AS boss
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS name,
      20 AS dept,
      null AS boss
  
) AS UNUSED_TABLE_NAME  ),
t_3_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      1 AS id,
      'go' AS skill
   UNION ALL
  
    SELECT
      2 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      3 AS id,
      'rust' AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      'go' AS skill
   UNION ALL
  
    SELECT
      6 AS id,
      'excel' AS skill
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_1_E.name AS name
FROM
  t_2_E AS E, t_3_S AS S, t_3_S AS t_0_S, t_2_E AS t_1_E
WHERE
  (t_0_S.id != E.id) AND
  (E.name = 'cid') AND
  (S.id = E.id) AND
  (t_0_S.skill = S.skill) AND
  (t_1_E.id = t_0_S.id)
GROUP BY 1;