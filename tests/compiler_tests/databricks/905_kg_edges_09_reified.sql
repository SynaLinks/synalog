WITH t_3_Assignments AS (SELECT * FROM VALUES
  (1, 1, 10, "lead"),
  (2, 2, 30, "dev")
AS UNUSED_TABLE_NAME(assignment_id, person_id, team_id, role)),
t_1_Assignment AS (SELECT
  t_2_Assignments.assignment_id AS assignment_id,
  t_2_Assignments.role AS role
FROM
  t_3_Assignments AS t_2_Assignments
GROUP BY 1, 2),
t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_0_AssignmentPerson AS (SELECT
  Assignment.assignment_id AS assignment_id,
  Person.person_id AS person_id
FROM
  t_1_Assignment AS Assignment, t_4_Person AS Person, t_3_Assignments AS Assignments
WHERE
  (Assignments.assignment_id = Assignment.assignment_id) AND
  (Assignments.person_id = Person.person_id)
GROUP BY 1, 2),
t_12_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_11_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_12_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_6_AssignmentTeam AS (SELECT
  t_7_Assignment.assignment_id AS assignment_id,
  t_8_Team.team_id AS team_id
FROM
  t_1_Assignment AS t_7_Assignment, t_11_Team AS t_8_Team, t_3_Assignments AS t_9_Assignments
WHERE
  (t_9_Assignments.assignment_id = t_7_Assignment.assignment_id) AND
  (t_9_Assignments.team_id = t_8_Team.team_id)
GROUP BY 1, 2)
SELECT
  AssignmentPerson.assignment_id AS assignment_id,
  AssignmentPerson.person_id AS person_id,
  AssignmentTeam.team_id AS team_id
FROM
  t_0_AssignmentPerson AS AssignmentPerson, t_6_AssignmentTeam AS AssignmentTeam
WHERE
  (AssignmentTeam.assignment_id = AssignmentPerson.assignment_id) ORDER BY assignment_id NULLS LAST;