WITH t_2_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_1_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_2_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_8_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  t_7_Employees.person_id AS person_id,
  t_7_Employees.name AS name,
  t_7_Employees.url AS url
FROM
  t_8_Employees AS t_7_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_3_MemberOf AS (SELECT
  t_4_Person.person_id AS person_id,
  t_5_Team.team_id AS team_id
FROM
  t_6_Person AS t_4_Person, t_1_Team AS t_5_Team, t_8_Employees AS Employees
WHERE
  (Employees.person_id = t_4_Person.person_id) AND
  (Employees.team_id = t_5_Team.team_id)
GROUP BY 1, 2)
SELECT
  MemberOf.person_id AS person_id,
  Person.name AS name
FROM
  t_1_Team AS t_0_Team, t_3_MemberOf AS MemberOf, t_6_Person AS Person
WHERE
  (t_0_Team.team_id = 30) AND
  (MemberOf.team_id = 30) AND
  (Person.person_id = MemberOf.person_id)
GROUP BY 1, 2 ORDER BY person_id NULLS LAST;