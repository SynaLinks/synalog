-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;
CREATE DATABASE IF NOT EXISTS synalog_home;

DROP TABLE IF EXISTS synalog_home.Person;
CREATE TABLE synalog_home.Person ENGINE = Memory AS WITH t_0_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      'ann' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/ann' AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      'bob' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/bob' AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      'cid' AS name,
      'ops' AS dept,
      20 AS team_id,
      'inactive' AS status,
      'https://x/cid' AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      'dan' AS name,
      'ops' AS dept,
      20 AS team_id,
      'active' AS status,
      'https://x/dan' AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      'eve' AS name,
      'eng' AS dept,
      30 AS team_id,
      'active' AS status,
      'https://x/eve' AS url
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_0_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id;

-- Interacting with table synalog_home.Person

DROP TABLE IF EXISTS synalog_home.Mentors;
CREATE TABLE synalog_home.Mentors ENGINE = Memory AS WITH t_1_Mentoring AS (SELECT * FROM (
  
    SELECT
      2 AS mentor_id,
      5 AS mentee_id
   UNION ALL
  
    SELECT
      1 AS mentor_id,
      4 AS mentee_id
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.person_id AS mentor_id,
  t_0_Person.person_id AS mentee_id
FROM
  synalog_home.Person AS Person, synalog_home.Person AS t_0_Person, t_1_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = Person.person_id) AND
  (Mentoring.mentee_id = t_0_Person.person_id)
GROUP BY 1, 2;

-- Interacting with table synalog_home.Mentors

WITH t_0_Pair_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Mentors.mentor_id AS a,
      Mentors.mentee_id AS b
    FROM
      synalog_home.Mentors AS Mentors
   UNION ALL
  
    SELECT
      t_1_Mentors.mentee_id AS a,
      t_1_Mentors.mentor_id AS b
    FROM
      synalog_home.Mentors AS t_1_Mentors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Pair_MultBodyAggAux.a AS a,
  Pair_MultBodyAggAux.b AS b
FROM
  t_0_Pair_MultBodyAggAux AS Pair_MultBodyAggAux
GROUP BY 1, 2 ORDER BY a, b;