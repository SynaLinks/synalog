DROP TABLE IF EXISTS logica_test.Person;
CREATE TABLE logica_test.Person AS WITH t_0_Employees AS (SELECT * FROM (
  
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

-- Interacting with table logica_test.Person

DROP TABLE IF EXISTS logica_test.Team;
CREATE TABLE logica_test.Team AS WITH t_0_Teams AS (SELECT * FROM (
  
    SELECT
      10 AS team_id,
      'core' AS team
   UNION ALL
  
    SELECT
      20 AS team_id,
      'infra' AS team
   UNION ALL
  
    SELECT
      30 AS team_id,
      'data' AS team
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_0_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id;

-- Interacting with table logica_test.Team

DROP TABLE IF EXISTS logica_test.Client;
CREATE TABLE logica_test.Client AS WITH t_0_Clients AS (SELECT * FROM (
  
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

-- Interacting with table logica_test.Client

WITH t_0_Employees AS (SELECT * FROM (
  
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
t_1_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_2_Team.team_id AS team_id
FROM
  logica_test.Person AS Person, logica_test.Team AS t_2_Team, t_0_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.team_id = t_2_Team.team_id)
GROUP BY 1, 2),
t_6_Engagements AS (SELECT * FROM (
  
    SELECT
      10 AS team_id,
      100 AS client_id
   UNION ALL
  
    SELECT
      20 AS team_id,
      100 AS client_id
   UNION ALL
  
    SELECT
      30 AS team_id,
      200 AS client_id
  
) AS UNUSED_TABLE_NAME  ),
t_3_EngagedWith AS (SELECT
  t_4_Team.team_id AS team_id,
  t_5_Client.client_id AS client_id
FROM
  logica_test.Team AS t_4_Team, logica_test.Client AS t_5_Client, t_6_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_4_Team.team_id) AND
  (Engagements.client_id = t_5_Client.client_id)
GROUP BY 1, 2)
SELECT
  EngagedWith.client_id AS client_id,
  t_0_Client.client AS client
FROM
  t_1_MemberOf AS MemberOf, t_3_EngagedWith AS EngagedWith, logica_test.Client AS t_0_Client
WHERE
  (MemberOf.person_id = 1) AND
  (EngagedWith.team_id = MemberOf.team_id) AND
  (t_0_Client.client_id = EngagedWith.client_id)
GROUP BY 1, 2 ORDER BY client_id;