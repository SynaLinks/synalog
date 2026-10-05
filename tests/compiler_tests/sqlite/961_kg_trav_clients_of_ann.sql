WITH t_5_Employees AS (SELECT * FROM (
  
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
t_3_Person AS (SELECT
  t_4_Employees.person_id AS person_id,
  t_4_Employees.name AS name,
  t_4_Employees.url AS url
FROM
  t_5_Employees AS t_4_Employees
GROUP BY t_4_Employees.person_id, t_4_Employees.name, t_4_Employees.url ORDER BY person_id NULLS LAST),
t_7_Teams AS (SELECT * FROM (
  
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
t_6_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_7_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id NULLS LAST),
t_1_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_2_Team.team_id AS team_id
FROM
  t_3_Person AS Person, t_6_Team AS t_2_Team, t_5_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.team_id = t_2_Team.team_id)
GROUP BY Person.person_id, t_2_Team.team_id),
t_13_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_12_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_13_Clients AS Clients
GROUP BY Clients.client_id, Clients.client ORDER BY client_id NULLS LAST),
t_14_Engagements AS (SELECT * FROM (
  
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
t_8_EngagedWith AS (SELECT
  t_9_Team.team_id AS team_id,
  t_10_Client.client_id AS client_id
FROM
  t_6_Team AS t_9_Team, t_12_Client AS t_10_Client, t_14_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_9_Team.team_id) AND
  (Engagements.client_id = t_10_Client.client_id)
GROUP BY t_9_Team.team_id, t_10_Client.client_id)
SELECT
  EngagedWith.client_id AS client_id,
  t_0_Client.client AS client
FROM
  t_1_MemberOf AS MemberOf, t_8_EngagedWith AS EngagedWith, t_12_Client AS t_0_Client
WHERE
  (MemberOf.person_id = 1) AND
  (EngagedWith.team_id = MemberOf.team_id) AND
  (t_0_Client.client_id = EngagedWith.client_id)
GROUP BY EngagedWith.client_id, t_0_Client.client ORDER BY client_id NULLS LAST;