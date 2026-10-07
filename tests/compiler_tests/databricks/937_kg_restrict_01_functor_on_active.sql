WITH t_4_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_2_Person AS (SELECT
  t_3_Employees.person_id AS person_id,
  t_3_Employees.name AS name,
  t_3_Employees.url AS url
FROM
  t_4_Employees AS t_3_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_1_Active AS (SELECT
  Person.person_id AS person_id
FROM
  t_2_Person AS Person, t_4_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.status = "active")
GROUP BY 1),
t_11_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_10_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_11_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_5_MemberOf AS (SELECT
  t_6_Person.person_id AS person_id,
  t_7_Team.team_id AS team_id
FROM
  t_2_Person AS t_6_Person, t_10_Team AS t_7_Team, t_4_Employees AS t_8_Employees
WHERE
  (t_8_Employees.person_id = t_6_Person.person_id) AND
  (t_8_Employees.team_id = t_7_Team.team_id)
GROUP BY 1, 2),
t_17_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_16_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_17_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_18_Engagements AS (SELECT * FROM VALUES
  (10, 100),
  (20, 100),
  (30, 200)
AS UNUSED_TABLE_NAME(team_id, client_id)),
t_12_EngagedWith AS (SELECT
  t_13_Team.team_id AS team_id,
  t_14_Client.client_id AS client_id
FROM
  t_10_Team AS t_13_Team, t_16_Client AS t_14_Client, t_18_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_13_Team.team_id) AND
  (Engagements.client_id = t_14_Client.client_id)
GROUP BY 1, 2),
t_0_ActiveReach AS (SELECT
  Active.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_1_Active AS Active, t_5_MemberOf AS MemberOf, t_12_EngagedWith AS EngagedWith
WHERE
  (MemberOf.person_id = Active.person_id) AND
  (EngagedWith.team_id = MemberOf.team_id)
GROUP BY 1, 2)
SELECT
  ActiveReach.person_id AS person_id,
  ActiveReach.client_id AS client_id
FROM
  t_0_ActiveReach AS ActiveReach ORDER BY person_id NULLS LAST, client_id NULLS LAST;