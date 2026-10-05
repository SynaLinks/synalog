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

WITH t_1_Who AS (SELECT
  Person.person_id AS person_id
FROM
  logica_test.Person AS Person
GROUP BY 1),
t_0_Employees AS (SELECT * FROM (
  
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
t_2_MemberOf AS (SELECT
  t_3_Person.person_id AS person_id,
  t_4_Team.team_id AS team_id
FROM
  logica_test.Person AS t_3_Person, logica_test.Team AS t_4_Team, t_0_Employees AS Employees
WHERE
  (Employees.person_id = t_3_Person.person_id) AND
  (Employees.team_id = t_4_Team.team_id)
GROUP BY 1, 2),
t_9_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_8_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_9_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id),
t_10_Engagements AS (SELECT * FROM (
  
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
t_5_EngagedWith AS (SELECT
  t_6_Team.team_id AS team_id,
  t_7_Client.client_id AS client_id
FROM
  logica_test.Team AS t_6_Team, t_8_Client AS t_7_Client, t_10_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_6_Team.team_id) AND
  (Engagements.client_id = t_7_Client.client_id)
GROUP BY 1, 2),
t_0_Reach AS (SELECT
  Who.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_1_Who AS Who, t_2_MemberOf AS MemberOf, t_5_EngagedWith AS EngagedWith
WHERE
  (MemberOf.person_id = Who.person_id) AND
  (EngagedWith.team_id = MemberOf.team_id)
GROUP BY 1, 2)
SELECT
  Reach.person_id AS person_id,
  Reach.client_id AS client_id
FROM
  t_0_Reach AS Reach ORDER BY person_id, client_id;