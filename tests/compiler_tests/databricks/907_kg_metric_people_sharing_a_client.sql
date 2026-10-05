WITH t_6_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  t_5_Employees.person_id AS person_id,
  t_5_Employees.name AS name,
  t_5_Employees.url AS url
FROM
  t_6_Employees AS t_5_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_8_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_7_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_8_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_2_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_3_Team.team_id AS team_id
FROM
  t_4_Person AS Person, t_7_Team AS t_3_Team, t_6_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.team_id = t_3_Team.team_id)
GROUP BY 1, 2),
t_14_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_13_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_14_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_15_Engagements AS (SELECT * FROM VALUES
  (10, 100),
  (20, 100),
  (30, 200)
AS UNUSED_TABLE_NAME(team_id, client_id)),
t_9_EngagedWith AS (SELECT
  t_10_Team.team_id AS team_id,
  t_11_Client.client_id AS client_id
FROM
  t_7_Team AS t_10_Team, t_13_Client AS t_11_Client, t_15_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_10_Team.team_id) AND
  (Engagements.client_id = t_11_Client.client_id)
GROUP BY 1, 2),
t_1_Serves AS (SELECT
  MemberOf.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_2_MemberOf AS MemberOf, t_9_EngagedWith AS EngagedWith
WHERE
  (EngagedWith.team_id = MemberOf.team_id)
GROUP BY 1, 2)
SELECT
  Serves.person_id AS a,
  t_0_Serves.person_id AS b
FROM
  t_1_Serves AS Serves, t_1_Serves AS t_0_Serves
WHERE
  (Serves.person_id < t_0_Serves.person_id) AND
  (t_0_Serves.client_id = Serves.client_id)
GROUP BY 1, 2 ORDER BY a NULLS LAST, b NULLS LAST;