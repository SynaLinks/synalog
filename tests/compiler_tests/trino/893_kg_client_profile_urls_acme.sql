WITH t_4_Teams AS (SELECT * FROM (
  
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
t_3_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_4_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id),
t_6_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_5_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_6_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id),
t_7_Engagements AS (SELECT * FROM (
  
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
t_0_EngagedWith AS (SELECT
  t_1_Team.team_id AS team_id,
  t_2_Client.client_id AS client_id
FROM
  t_3_Team AS t_1_Team, t_5_Client AS t_2_Client, t_7_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_1_Team.team_id) AND
  (Engagements.client_id = t_2_Client.client_id)
GROUP BY 1, 2),
t_13_Employees AS (SELECT * FROM (
  
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
t_11_Person AS (SELECT
  t_12_Employees.person_id AS person_id,
  t_12_Employees.name AS name,
  t_12_Employees.url AS url
FROM
  t_13_Employees AS t_12_Employees
GROUP BY 1, 2, 3 ORDER BY person_id),
t_8_MemberOf AS (SELECT
  t_9_Person.person_id AS person_id,
  t_10_Team.team_id AS team_id
FROM
  t_11_Person AS t_9_Person, t_3_Team AS t_10_Team, t_13_Employees AS Employees
WHERE
  (Employees.person_id = t_9_Person.person_id) AND
  (Employees.team_id = t_10_Team.team_id)
GROUP BY 1, 2)
SELECT
  Person.url AS url
FROM
  t_0_EngagedWith AS EngagedWith, t_8_MemberOf AS MemberOf, t_11_Person AS Person
WHERE
  (EngagedWith.client_id = 100) AND
  (MemberOf.team_id = EngagedWith.team_id) AND
  (Person.person_id = MemberOf.person_id)
GROUP BY 1 ORDER BY url;