DROP TABLE IF EXISTS synalog_test.Person;
CREATE TABLE synalog_test.Person AS WITH t_0_Employees AS (SELECT * FROM (
  
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

-- Interacting with table synalog_test.Person

DROP TABLE IF EXISTS synalog_test.Team;
CREATE TABLE synalog_test.Team AS WITH t_0_Teams AS (SELECT * FROM (
  
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

-- Interacting with table synalog_test.Team

DROP TABLE IF EXISTS synalog_test.MemberOf;
CREATE TABLE synalog_test.MemberOf AS WITH t_0_Employees AS (SELECT * FROM (
  
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
  Person.person_id AS person_id,
  Team.team_id AS team_id
FROM
  synalog_test.Person AS Person, synalog_test.Team AS Team, t_0_Employees AS Employees
WHERE
  (Employees.person_id IS NOT DISTINCT FROM Person.person_id) AND
  (Employees.team_id IS NOT DISTINCT FROM Team.team_id)
GROUP BY 1, 2;

-- Interacting with table synalog_test.MemberOf

DROP TABLE IF EXISTS synalog_test.EngagedWith;
CREATE TABLE synalog_test.EngagedWith AS WITH t_1_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_0_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_1_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id),
t_2_Engagements AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Team.team_id AS team_id,
  Client.client_id AS client_id
FROM
  synalog_test.Team AS Team, t_0_Client AS Client, t_2_Engagements AS Engagements
WHERE
  (Engagements.team_id IS NOT DISTINCT FROM Team.team_id) AND
  (Engagements.client_id IS NOT DISTINCT FROM Client.client_id)
GROUP BY 1, 2;

-- Interacting with table synalog_test.EngagedWith

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
t_1_Active AS (SELECT
  Person.person_id AS person_id
FROM
  synalog_test.Person AS Person, t_0_Employees AS Employees
WHERE
  (Employees.person_id IS NOT DISTINCT FROM Person.person_id) AND
  (Employees.status = 'active')
GROUP BY 1),
t_0_ActiveReach AS (SELECT
  Active.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_1_Active AS Active, synalog_test.MemberOf AS MemberOf, synalog_test.EngagedWith AS EngagedWith
WHERE
  (MemberOf.person_id IS NOT DISTINCT FROM Active.person_id) AND
  (EngagedWith.team_id IS NOT DISTINCT FROM MemberOf.team_id)
GROUP BY 1, 2)
SELECT
  ActiveReach.person_id AS person_id,
  ActiveReach.client_id AS client_id
FROM
  t_0_ActiveReach AS ActiveReach ORDER BY person_id, client_id;