-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Person_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Manages.boss AS name
    FROM
      t_2_Manages AS Manages
   UNION ALL
  
    SELECT
      t_3_Manages.report AS name
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Person AS (SELECT
  Person_MultBodyAggAux.name AS name
FROM
  t_1_Person_MultBodyAggAux AS Person_MultBodyAggAux
GROUP BY 1),
t_5_Boss AS (SELECT
  t_6_Manages.boss AS name
FROM
  t_2_Manages AS t_6_Manages
GROUP BY 1)
SELECT
  Person.name AS name
FROM
  t_0_Person AS Person
WHERE
  NOT (Person.name IS NOT NULL AND CAST(Person.name AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    t_4_Boss.name AS synalog_k0
  FROM
    t_5_Boss AS t_4_Boss
  GROUP BY 1) AS synalog_m)) ORDER BY name;