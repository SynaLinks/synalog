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

DROP TABLE IF EXISTS logica_test.Related;
CREATE TABLE logica_test.Related AS WITH t_3_Management AS (SELECT * FROM (
  
    SELECT
      1 AS manager_id,
      2 AS employee_id
   UNION ALL
  
    SELECT
      1 AS manager_id,
      5 AS employee_id
   UNION ALL
  
    SELECT
      4 AS manager_id,
      3 AS employee_id
   UNION ALL
  
    SELECT
      2 AS manager_id,
      6 AS employee_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_2_Person.person_id AS employee_id
FROM
  logica_test.Person AS Person, logica_test.Person AS t_2_Person, t_3_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_2_Person.person_id)
GROUP BY 1, 2),
t_7_Mentoring AS (SELECT * FROM (
  
    SELECT
      2 AS mentor_id,
      5 AS mentee_id
   UNION ALL
  
    SELECT
      1 AS mentor_id,
      4 AS mentee_id
  
) AS UNUSED_TABLE_NAME  ),
t_4_Mentors AS (SELECT
  t_5_Person.person_id AS mentor_id,
  t_6_Person.person_id AS mentee_id
FROM
  logica_test.Person AS t_5_Person, logica_test.Person AS t_6_Person, t_7_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = t_5_Person.person_id) AND
  (Mentoring.mentee_id = t_6_Person.person_id)
GROUP BY 1, 2),
t_0_Related_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source_id,
      Manages.employee_id AS target_id,
      'manages' AS type
    FROM
      t_1_Manages AS Manages
   UNION ALL
  
    SELECT
      Mentors.mentor_id AS source_id,
      Mentors.mentee_id AS target_id,
      'mentors' AS type
    FROM
      t_4_Mentors AS Mentors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Related_MultBodyAggAux.source_id AS source_id,
  Related_MultBodyAggAux.target_id AS target_id,
  Related_MultBodyAggAux.type AS type
FROM
  t_0_Related_MultBodyAggAux AS Related_MultBodyAggAux
GROUP BY 1, 2, 3;

-- Interacting with table logica_test.Related

WITH t_0_N_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Related.target_id AS neighbor_id,
      Related.type AS type
    FROM
      logica_test.Related AS Related
    WHERE
      (Related.source_id = 3)
   UNION ALL
  
    SELECT
      t_1_Related.source_id AS neighbor_id,
      t_1_Related.type AS type
    FROM
      logica_test.Related AS t_1_Related
    WHERE
      (t_1_Related.target_id = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N_MultBodyAggAux.neighbor_id AS neighbor_id,
  N_MultBodyAggAux.type AS type
FROM
  t_0_N_MultBodyAggAux AS N_MultBodyAggAux
GROUP BY 1, 2 ORDER BY neighbor_id, type;