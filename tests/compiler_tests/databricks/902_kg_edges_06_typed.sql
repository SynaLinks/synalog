WITH t_4_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_3_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_4_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_6_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_1_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_2_Person.person_id AS employee_id
FROM
  t_3_Person AS Person, t_3_Person AS t_2_Person, t_6_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_2_Person.person_id)
GROUP BY 1, 2),
t_10_Mentoring AS (SELECT * FROM VALUES
  (2, 5),
  (1, 4)
AS UNUSED_TABLE_NAME(mentor_id, mentee_id)),
t_7_Mentors AS (SELECT
  t_8_Person.person_id AS mentor_id,
  t_9_Person.person_id AS mentee_id
FROM
  t_3_Person AS t_8_Person, t_3_Person AS t_9_Person, t_10_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = t_8_Person.person_id) AND
  (Mentoring.mentee_id = t_9_Person.person_id)
GROUP BY 1, 2),
t_0_Related_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source_id,
      Manages.employee_id AS target_id,
      "manages" AS type
    FROM
      t_1_Manages AS Manages
   UNION ALL
  
    SELECT
      Mentors.mentor_id AS source_id,
      Mentors.mentee_id AS target_id,
      "mentors" AS type
    FROM
      t_7_Mentors AS Mentors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Related_MultBodyAggAux.source_id AS source_id,
  Related_MultBodyAggAux.target_id AS target_id,
  Related_MultBodyAggAux.type AS type
FROM
  t_0_Related_MultBodyAggAux AS Related_MultBodyAggAux
GROUP BY 1, 2, 3 ORDER BY source_id NULLS LAST, target_id NULLS LAST, type NULLS LAST;