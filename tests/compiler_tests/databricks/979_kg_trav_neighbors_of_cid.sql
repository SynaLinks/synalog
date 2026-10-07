WITH t_6_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_5_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_6_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_8_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_4_Person.person_id AS employee_id
FROM
  t_5_Person AS Person, t_5_Person AS t_4_Person, t_8_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_4_Person.person_id)
GROUP BY 1, 2),
t_12_Mentoring AS (SELECT * FROM VALUES
  (2, 5),
  (1, 4)
AS UNUSED_TABLE_NAME(mentor_id, mentee_id)),
t_9_Mentors AS (SELECT
  t_10_Person.person_id AS mentor_id,
  t_11_Person.person_id AS mentee_id
FROM
  t_5_Person AS t_10_Person, t_5_Person AS t_11_Person, t_12_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = t_10_Person.person_id) AND
  (Mentoring.mentee_id = t_11_Person.person_id)
GROUP BY 1, 2),
t_2_Related_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source_id,
      Manages.employee_id AS target_id,
      "manages" AS type
    FROM
      t_3_Manages AS Manages
   UNION ALL
  
    SELECT
      Mentors.mentor_id AS source_id,
      Mentors.mentee_id AS target_id,
      "mentors" AS type
    FROM
      t_9_Mentors AS Mentors
  
) AS UNUSED_TABLE_NAME  ),
t_1_Related AS (SELECT
  Related_MultBodyAggAux.source_id AS source_id,
  Related_MultBodyAggAux.target_id AS target_id,
  Related_MultBodyAggAux.type AS type
FROM
  t_2_Related_MultBodyAggAux AS Related_MultBodyAggAux
GROUP BY 1, 2, 3),
t_0_N_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Related.target_id AS neighbor_id,
      Related.type AS type
    FROM
      t_1_Related AS Related
    WHERE
      (Related.source_id = 3)
   UNION ALL
  
    SELECT
      t_13_Related.source_id AS neighbor_id,
      t_13_Related.type AS type
    FROM
      t_1_Related AS t_13_Related
    WHERE
      (t_13_Related.target_id = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N_MultBodyAggAux.neighbor_id AS neighbor_id,
  N_MultBodyAggAux.type AS type
FROM
  t_0_N_MultBodyAggAux AS N_MultBodyAggAux
GROUP BY 1, 2 ORDER BY neighbor_id NULLS LAST, type NULLS LAST;