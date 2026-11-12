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

DROP TABLE IF EXISTS synalog_home.Client;
CREATE TABLE synalog_home.Client ENGINE = Memory AS WITH t_0_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_0_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id;

-- Interacting with table synalog_home.Client

WITH t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      100 AS client_id,
      5 AS amount
   UNION ALL
  
    SELECT
      1 AS person_id,
      100 AS client_id,
      7 AS amount
   UNION ALL
  
    SELECT
      2 AS person_id,
      200 AS client_id,
      3 AS amount
   UNION ALL
  
    SELECT
      4 AS person_id,
      100 AS client_id,
      1 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.person_id AS person_id,
  t_0_Client.client_id AS client_id,
  SUM(Orders.amount) AS total
FROM
  synalog_home.Person AS Person, synalog_home.Client AS t_0_Client, t_1_Orders AS Orders
WHERE
  (Orders.person_id = Person.person_id) AND
  (Orders.client_id = t_0_Client.client_id)
GROUP BY 1, 2 ORDER BY person_id, client_id;