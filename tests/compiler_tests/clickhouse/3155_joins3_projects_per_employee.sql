-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_E AS (SELECT * FROM (
  
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
t_1_Pr AS (SELECT * FROM (
  
    SELECT
      100 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      101 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      102 AS pid,
      20 AS dept
   UNION ALL
  
    SELECT
      103 AS pid,
      50 AS dept
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name,
  SUM(1) AS n
FROM
  t_0_E AS E, t_1_Pr AS Pr
WHERE
  (Pr.dept = E.dept)
GROUP BY 1 ORDER BY name, n;