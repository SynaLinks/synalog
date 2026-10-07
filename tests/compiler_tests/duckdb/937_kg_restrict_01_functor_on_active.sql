-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_Employees AS (SELECT * FROM (
  
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
t_2_Person AS (SELECT
  t_3_Employees.person_id AS person_id,
  t_3_Employees.name AS name,
  t_3_Employees.url AS url
FROM
  t_4_Employees AS t_3_Employees
GROUP BY t_3_Employees.person_id, t_3_Employees.name, t_3_Employees.url ORDER BY person_id),
t_1_Active AS (SELECT
  Person.person_id AS person_id
FROM
  t_2_Person AS Person, t_4_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.status = 'active')
GROUP BY Person.person_id),
t_11_Teams AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_10_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_11_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_5_MemberOf AS (SELECT
  t_6_Person.person_id AS person_id,
  t_7_Team.team_id AS team_id
FROM
  t_2_Person AS t_6_Person, t_10_Team AS t_7_Team, t_4_Employees AS t_8_Employees
WHERE
  (t_8_Employees.person_id = t_6_Person.person_id) AND
  (t_8_Employees.team_id = t_7_Team.team_id)
GROUP BY t_6_Person.person_id, t_7_Team.team_id),
t_17_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_16_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_17_Clients AS Clients
GROUP BY Clients.client_id, Clients.client ORDER BY client_id),
t_18_Engagements AS (SELECT * FROM (
  
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
t_12_EngagedWith AS (SELECT
  t_13_Team.team_id AS team_id,
  t_14_Client.client_id AS client_id
FROM
  t_10_Team AS t_13_Team, t_16_Client AS t_14_Client, t_18_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_13_Team.team_id) AND
  (Engagements.client_id = t_14_Client.client_id)
GROUP BY t_13_Team.team_id, t_14_Client.client_id),
t_0_ActiveReach AS (SELECT
  Active.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_1_Active AS Active, t_5_MemberOf AS MemberOf, t_12_EngagedWith AS EngagedWith
WHERE
  (MemberOf.person_id = Active.person_id) AND
  (EngagedWith.team_id = MemberOf.team_id)
GROUP BY Active.person_id, EngagedWith.client_id)
SELECT
  ActiveReach.person_id AS person_id,
  ActiveReach.client_id AS client_id
FROM
  t_0_ActiveReach AS ActiveReach ORDER BY person_id, client_id;