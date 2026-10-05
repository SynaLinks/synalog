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
GROUP BY 1, 2)
SELECT
  t_0_MemberOf.person_id AS person_id
FROM
  t_1_MemberOf AS MemberOf, t_1_MemberOf AS t_0_MemberOf
WHERE
  (t_0_MemberOf.person_id != 1) AND
  (MemberOf.person_id = 1) AND
  (t_0_MemberOf.team_id = MemberOf.team_id)
GROUP BY 1 ORDER BY person_id NULLS LAST;