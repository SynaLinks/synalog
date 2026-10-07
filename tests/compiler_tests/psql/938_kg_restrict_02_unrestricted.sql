-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_Employees AS (SELECT * FROM (
  
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
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_3_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_1_Who AS (SELECT
  Person.person_id AS person_id
FROM
  t_2_Person AS Person
GROUP BY Person.person_id),
t_10_Teams AS (SELECT * FROM (
  
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
t_9_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_10_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_4_MemberOf AS (SELECT
  t_5_Person.person_id AS person_id,
  t_6_Team.team_id AS team_id
FROM
  t_2_Person AS t_5_Person, t_9_Team AS t_6_Team, t_3_Employees AS t_7_Employees
WHERE
  (t_7_Employees.person_id = t_5_Person.person_id) AND
  (t_7_Employees.team_id = t_6_Team.team_id)
GROUP BY t_5_Person.person_id, t_6_Team.team_id),
t_16_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_15_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_16_Clients AS Clients
GROUP BY Clients.client_id, Clients.client ORDER BY client_id),
t_17_Engagements AS (SELECT * FROM (
  
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
t_11_EngagedWith AS (SELECT
  t_12_Team.team_id AS team_id,
  t_13_Client.client_id AS client_id
FROM
  t_9_Team AS t_12_Team, t_15_Client AS t_13_Client, t_17_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_12_Team.team_id) AND
  (Engagements.client_id = t_13_Client.client_id)
GROUP BY t_12_Team.team_id, t_13_Client.client_id),
t_0_Reach AS (SELECT
  Who.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_1_Who AS Who, t_4_MemberOf AS MemberOf, t_11_EngagedWith AS EngagedWith
WHERE
  (MemberOf.person_id = Who.person_id) AND
  (EngagedWith.team_id = MemberOf.team_id)
GROUP BY Who.person_id, EngagedWith.client_id)
SELECT
  Reach.person_id AS person_id,
  Reach.client_id AS client_id
FROM
  t_0_Reach AS Reach ORDER BY person_id, client_id;