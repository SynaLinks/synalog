WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_3_Person AS (SELECT
  t_4_Employees.person_id AS person_id,
  t_4_Employees.name AS name,
  t_4_Employees.url AS url
FROM
  t_5_Employees AS t_4_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_6_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_7_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_1_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_2_Team.team_id AS team_id
FROM
  t_3_Person AS Person, t_6_Team AS t_2_Team, t_5_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.team_id = t_2_Team.team_id)
GROUP BY 1, 2),
t_13_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_12_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_13_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_14_Engagements AS (SELECT * FROM VALUES
  (10, 100),
  (20, 100),
  (30, 200)
AS UNUSED_TABLE_NAME(team_id, client_id)),
t_8_EngagedWith AS (SELECT
  t_9_Team.team_id AS team_id,
  t_10_Client.client_id AS client_id
FROM
  t_6_Team AS t_9_Team, t_12_Client AS t_10_Client, t_14_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_9_Team.team_id) AND
  (Engagements.client_id = t_10_Client.client_id)
GROUP BY 1, 2)
SELECT
  EngagedWith.client_id AS client_id,
  t_0_Client.client AS client
FROM
  t_1_MemberOf AS MemberOf, t_8_EngagedWith AS EngagedWith, t_12_Client AS t_0_Client
WHERE
  (MemberOf.person_id = 4) AND
  (EngagedWith.team_id = MemberOf.team_id) AND
  (t_0_Client.client_id = EngagedWith.client_id)
GROUP BY 1, 2 ORDER BY client_id NULLS LAST;