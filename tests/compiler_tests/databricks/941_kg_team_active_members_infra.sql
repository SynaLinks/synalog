WITH t_3_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_1_Person AS (SELECT
  t_2_Employees.person_id AS person_id,
  t_2_Employees.name AS name,
  t_2_Employees.url AS url
FROM
  t_3_Employees AS t_2_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_0_Active AS (SELECT
  Person.person_id AS person_id
FROM
  t_1_Person AS Person, t_3_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.status = "active")
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
  t_1_Person AS t_5_Person, t_9_Team AS t_6_Team, t_3_Employees AS t_7_Employees
WHERE
  (t_7_Employees.person_id = t_5_Person.person_id) AND
  (t_7_Employees.team_id = t_6_Team.team_id)
GROUP BY 1, 2)
SELECT
  Active.person_id AS person_id
FROM
  t_0_Active AS Active, t_4_MemberOf AS MemberOf
WHERE
  (MemberOf.person_id = Active.person_id) AND
  (MemberOf.team_id = 20)
GROUP BY 1 ORDER BY person_id NULLS LAST;