DROP TABLE IF EXISTS logica_test.Assignment;
CREATE TABLE logica_test.Assignment AS WITH t_0_Assignments AS (SELECT * FROM (
  
    SELECT
      1 AS assignment_id,
      1 AS person_id,
      10 AS team_id,
      'lead' AS role
   UNION ALL
  
    SELECT
      2 AS assignment_id,
      2 AS person_id,
      30 AS team_id,
      'dev' AS role
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Assignments.assignment_id AS assignment_id,
  Assignments.role AS role
FROM
  t_0_Assignments AS Assignments
GROUP BY 1, 2;

-- Interacting with table logica_test.Assignment

DROP TABLE IF EXISTS logica_test.Person;
CREATE TABLE logica_test.Person AS WITH t_0_Employees AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_0_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id;

-- Interacting with table logica_test.Person

DROP TABLE IF EXISTS logica_test.Team;
CREATE TABLE logica_test.Team AS WITH t_0_Teams AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_0_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id;

-- Interacting with table logica_test.Team

WITH t_0_Assignments AS (SELECT * FROM (
  
    SELECT
      1 AS assignment_id,
      1 AS person_id,
      10 AS team_id,
      'lead' AS role
   UNION ALL
  
    SELECT
      2 AS assignment_id,
      2 AS person_id,
      30 AS team_id,
      'dev' AS role
  
) AS UNUSED_TABLE_NAME  ),
t_0_AssignmentPerson AS (SELECT
  Assignment.assignment_id AS assignment_id,
  Person.person_id AS person_id
FROM
  logica_test.Assignment AS Assignment, logica_test.Person AS Person, t_0_Assignments AS Assignments
WHERE
  (Assignments.assignment_id = Assignment.assignment_id) AND
  (Assignments.person_id = Person.person_id)
GROUP BY 1, 2),
t_1_AssignmentTeam AS (SELECT
  t_2_Assignment.assignment_id AS assignment_id,
  t_3_Team.team_id AS team_id
FROM
  logica_test.Assignment AS t_2_Assignment, logica_test.Team AS t_3_Team, t_0_Assignments AS t_4_Assignments
WHERE
  (t_4_Assignments.assignment_id = t_2_Assignment.assignment_id) AND
  (t_4_Assignments.team_id = t_3_Team.team_id)
GROUP BY 1, 2)
SELECT
  AssignmentPerson.assignment_id AS assignment_id,
  AssignmentPerson.person_id AS person_id,
  AssignmentTeam.team_id AS team_id
FROM
  t_0_AssignmentPerson AS AssignmentPerson, t_1_AssignmentTeam AS AssignmentTeam
WHERE
  (AssignmentTeam.assignment_id = AssignmentPerson.assignment_id) ORDER BY assignment_id;