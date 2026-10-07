WITH t_3_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_2_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_3_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_1_Who AS (SELECT
  Person.person_id AS person_id
FROM
  t_2_Person AS Person
GROUP BY 1),
t_10_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_9_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_10_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_4_MemberOf AS (SELECT
  t_5_Person.person_id AS person_id,
  t_6_Team.team_id AS team_id
FROM
  t_2_Person AS t_5_Person, t_9_Team AS t_6_Team, t_3_Employees AS t_7_Employees
WHERE
  (t_7_Employees.person_id = t_5_Person.person_id) AND
  (t_7_Employees.team_id = t_6_Team.team_id)
GROUP BY 1, 2),
t_16_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_15_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_16_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_17_Engagements AS (SELECT * FROM VALUES
  (10, 100),
  (20, 100),
  (30, 200)
AS UNUSED_TABLE_NAME(team_id, client_id)),
t_11_EngagedWith AS (SELECT
  t_12_Team.team_id AS team_id,
  t_13_Client.client_id AS client_id
FROM
  t_9_Team AS t_12_Team, t_15_Client AS t_13_Client, t_17_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_12_Team.team_id) AND
  (Engagements.client_id = t_13_Client.client_id)
GROUP BY 1, 2),
t_0_Reach AS (SELECT
  Who.person_id AS person_id,
  EngagedWith.client_id AS client_id
FROM
  t_1_Who AS Who, t_4_MemberOf AS MemberOf, t_11_EngagedWith AS EngagedWith
WHERE
  (MemberOf.person_id = Who.person_id) AND
  (EngagedWith.team_id = MemberOf.team_id)
GROUP BY 1, 2)
SELECT
  Reach.person_id AS person_id,
  Reach.client_id AS client_id
FROM
  t_0_Reach AS Reach ORDER BY person_id NULLS LAST, client_id NULLS LAST;