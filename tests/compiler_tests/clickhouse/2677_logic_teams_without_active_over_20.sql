-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Ann' AS name,
      'red' AS team,
      34 AS age,
      true AS active
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      'red' AS team,
      null AS age,
      false AS active
   UNION ALL
  
    SELECT
      3 AS id,
      'Cid' AS name,
      'blue' AS team,
      52 AS age,
      true AS active
   UNION ALL
  
    SELECT
      4 AS id,
      'Dee' AS name,
      'blue' AS team,
      23 AS age,
      false AS active
   UNION ALL
  
    SELECT
      5 AS id,
      'Eve' AS name,
      'green' AS team,
      41 AS age,
      null AS active
   UNION ALL
  
    SELECT
      6 AS id,
      'Fay' AS name,
      'red' AS team,
      19 AS age,
      true AS active
   UNION ALL
  
    SELECT
      7 AS id,
      'Gus' AS name,
      'gold' AS team,
      60 AS age,
      false AS active
  
) AS UNUSED_TABLE_NAME  ),
t_1_Team AS (SELECT
  Person.team AS team
FROM
  t_2_Person AS Person
GROUP BY 1),
t_3_Senior AS (SELECT
  t_4_Person.team AS team
FROM
  t_2_Person AS t_4_Person
WHERE
  t_4_Person.active AND
  (t_4_Person.age > 20)
GROUP BY 1)
SELECT
  t_0_Team.team AS team
FROM
  t_1_Team AS t_0_Team
WHERE
  NOT (t_0_Team.team IS NOT NULL AND CAST(t_0_Team.team AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Senior.team AS synalog_k0
  FROM
    t_3_Senior AS Senior
  GROUP BY 1) AS synalog_m)) ORDER BY team;