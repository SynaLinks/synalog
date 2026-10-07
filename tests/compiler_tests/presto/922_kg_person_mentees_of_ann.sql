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

WITH t_2_Mentoring AS (SELECT * FROM (
  
    SELECT
      2 AS mentor_id,
      5 AS mentee_id
   UNION ALL
  
    SELECT
      1 AS mentor_id,
      4 AS mentee_id
  
) AS UNUSED_TABLE_NAME  ),
t_0_Mentors AS (SELECT
  Person.person_id AS mentor_id,
  t_1_Person.person_id AS mentee_id
FROM
  logica_test.Person AS Person, logica_test.Person AS t_1_Person, t_2_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = Person.person_id) AND
  (Mentoring.mentee_id = t_1_Person.person_id)
GROUP BY 1, 2)
SELECT
  Mentors.mentee_id AS mentee_id
FROM
  t_0_Mentors AS Mentors
WHERE
  (Mentors.mentor_id = 1)
GROUP BY 1 ORDER BY mentee_id;