-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_Employees AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_Person AS (SELECT * FROM (
SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_2_Employees AS Employees
GROUP BY 1, 2, 3
) AS UNUSED_TABLE_NAME ORDER BY person_id IS NULL, person_id),
t_4_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_3_Client AS (SELECT * FROM (
SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_4_Clients AS Clients
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY client_id IS NULL, client_id),
t_5_Orders AS (SELECT * FROM (
  
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
SELECT * FROM (
SELECT
  Person.person_id AS person_id,
  t_0_Client.client_id AS client_id,
  SUM(Orders.amount) AS total
FROM
  t_1_Person AS Person, t_3_Client AS t_0_Client, t_5_Orders AS Orders
WHERE
  (Orders.person_id = Person.person_id) AND
  (Orders.client_id = t_0_Client.client_id)
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY person_id IS NULL, person_id, client_id IS NULL, client_id;