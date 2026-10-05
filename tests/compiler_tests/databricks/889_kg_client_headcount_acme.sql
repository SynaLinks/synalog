WITH t_5_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_4_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_5_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_7_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_6_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_7_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_8_Engagements AS (SELECT * FROM VALUES
  (10, 100),
  (20, 100),
  (30, 200)
AS UNUSED_TABLE_NAME(team_id, client_id)),
t_1_EngagedWith AS (SELECT
  t_2_Team.team_id AS team_id,
  t_3_Client.client_id AS client_id
FROM
  t_4_Team AS t_2_Team, t_6_Client AS t_3_Client, t_8_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_2_Team.team_id) AND
  (Engagements.client_id = t_3_Client.client_id)
GROUP BY 1, 2),
t_13_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_11_Person AS (SELECT
  t_12_Employees.person_id AS person_id,
  t_12_Employees.name AS name,
  t_12_Employees.url AS url
FROM
  t_13_Employees AS t_12_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_10_Team.team_id AS team_id
FROM
  t_11_Person AS Person, t_4_Team AS t_10_Team, t_13_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.team_id = t_10_Team.team_id)
GROUP BY 1, 2),
t_0_Serves AS (SELECT
  MemberOf.person_id AS person_id
FROM
  t_1_EngagedWith AS EngagedWith, t_9_MemberOf AS MemberOf
WHERE
  (EngagedWith.client_id = 100) AND
  (MemberOf.team_id = EngagedWith.team_id)
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_Serves AS Serves;