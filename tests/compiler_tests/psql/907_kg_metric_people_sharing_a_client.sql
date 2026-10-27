-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_6_Employees AS (SELECT * FROM (
  
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
t_4_Person AS (SELECT
  t_5_Employees.person_id AS person_id,
  t_5_Employees.name AS name,
  t_5_Employees.url AS url
FROM
  t_6_Employees AS t_5_Employees
GROUP BY t_5_Employees.person_id, t_5_Employees.name, t_5_Employees.url ORDER BY person_id),
t_8_Teams AS (SELECT * FROM (
  
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
t_7_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_8_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_2_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_3_Team.team_id AS team_id
FROM
  t_4_Person AS Person, t_7_Team AS t_3_Team, t_6_Employees AS Employees
WHERE
  (COALESCE(Employees.person_id, 0) = COALESCE(Person.person_id, 0) AND (Employees.person_id IS NULL) = (Person.person_id IS NULL)) AND
  (COALESCE(Employees.team_id, 0) = COALESCE(t_3_Team.team_id, 0) AND (Employees.team_id IS NULL) = (t_3_Team.team_id IS NULL))
GROUP BY Person.person_id, t_3_Team.team_id),
t_14_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_13_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_14_Clients AS Clients
GROUP BY Clients.client_id, Clients.client ORDER BY client_id),
t_15_Engagements AS (SELECT * FROM (
  
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
t_9_EngagedWith AS (SELECT
  t_10_Team.team_id AS team_id,
  t_11_Client.client_id AS client_id
FROM
  t_7_Team AS t_10_Team, t_13_Client AS t_11_Client, t_15_Engagements AS Engagements
WHERE
  (COALESCE(Engagements.team_id, 0) = COALESCE(t_10_Team.team_id, 0) AND (Engagements.team_id IS NULL) = (t_10_Team.team_id IS NULL)) AND
  (COALESCE(Engagements.client_id, 0) = COALESCE(t_11_Client.client_id, 0) AND (Engagements.client_id IS NULL) = (t_11_Client.client_id IS NULL))
GROUP BY t_10_Team.team_id, t_11_Client.client_id),
t_1_Serves AS (SELECT
  MemberOf.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_2_MemberOf AS MemberOf, t_9_EngagedWith AS EngagedWith
WHERE
  (COALESCE(EngagedWith.team_id, 0) = COALESCE(MemberOf.team_id, 0) AND (EngagedWith.team_id IS NULL) = (MemberOf.team_id IS NULL))
GROUP BY MemberOf.person_id, EngagedWith.client_id)
SELECT
  Serves.person_id AS a,
  t_0_Serves.person_id AS b
FROM
  t_1_Serves AS Serves, t_1_Serves AS t_0_Serves
WHERE
  (Serves.person_id < t_0_Serves.person_id) AND
  (COALESCE(t_0_Serves.client_id, 0) = COALESCE(Serves.client_id, 0) AND (t_0_Serves.client_id IS NULL) = (Serves.client_id IS NULL))
GROUP BY Serves.person_id, t_0_Serves.person_id ORDER BY a, b;