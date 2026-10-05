-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_Assignments AS (SELECT * FROM (
  
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
t_1_Assignment AS (SELECT
  t_2_Assignments.assignment_id AS assignment_id,
  t_2_Assignments.role AS role
FROM
  t_3_Assignments AS t_2_Assignments
GROUP BY t_2_Assignments.assignment_id, t_2_Assignments.role),
t_5_Employees AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_0_AssignmentPerson AS (SELECT
  Assignment.assignment_id AS assignment_id,
  Person.person_id AS person_id
FROM
  t_1_Assignment AS Assignment, t_4_Person AS Person, t_3_Assignments AS Assignments
WHERE
  (Assignments.assignment_id = Assignment.assignment_id) AND
  (Assignments.person_id = Person.person_id)
GROUP BY Assignment.assignment_id, Person.person_id),
t_12_Teams AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_11_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_12_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_6_AssignmentTeam AS (SELECT
  t_7_Assignment.assignment_id AS assignment_id,
  t_8_Team.team_id AS team_id
FROM
  t_1_Assignment AS t_7_Assignment, t_11_Team AS t_8_Team, t_3_Assignments AS t_9_Assignments
WHERE
  (t_9_Assignments.assignment_id = t_7_Assignment.assignment_id) AND
  (t_9_Assignments.team_id = t_8_Team.team_id)
GROUP BY t_7_Assignment.assignment_id, t_8_Team.team_id)
SELECT
  AssignmentPerson.assignment_id AS assignment_id,
  AssignmentPerson.person_id AS person_id,
  AssignmentTeam.team_id AS team_id
FROM
  t_0_AssignmentPerson AS AssignmentPerson, t_6_AssignmentTeam AS AssignmentTeam
WHERE
  (AssignmentTeam.assignment_id = AssignmentPerson.assignment_id) ORDER BY assignment_id;