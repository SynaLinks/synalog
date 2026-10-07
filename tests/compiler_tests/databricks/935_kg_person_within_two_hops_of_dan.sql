WITH t_8_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_7_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_8_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_10_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_5_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_6_Person.person_id AS employee_id
FROM
  t_7_Person AS Person, t_7_Person AS t_6_Person, t_10_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_6_Person.person_id)
GROUP BY 1, 2),
t_14_Mentoring AS (SELECT * FROM VALUES
  (2, 5),
  (1, 4)
AS UNUSED_TABLE_NAME(mentor_id, mentee_id)),
t_11_Mentors AS (SELECT
  t_12_Person.person_id AS mentor_id,
  t_13_Person.person_id AS mentee_id
FROM
  t_7_Person AS t_12_Person, t_7_Person AS t_13_Person, t_14_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = t_12_Person.person_id) AND
  (Mentoring.mentee_id = t_13_Person.person_id)
GROUP BY 1, 2),
t_4_Related_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source_id,
      Manages.employee_id AS target_id
    FROM
      t_5_Manages AS Manages
   UNION ALL
  
    SELECT
      Mentors.mentor_id AS source_id,
      Mentors.mentee_id AS target_id
    FROM
      t_11_Mentors AS Mentors
  
) AS UNUSED_TABLE_NAME  ),
t_3_Related AS (SELECT
  Related_MultBodyAggAux.source_id AS source_id,
  Related_MultBodyAggAux.target_id AS target_id
FROM
  t_4_Related_MultBodyAggAux AS Related_MultBodyAggAux
GROUP BY 1, 2),
t_2_Link_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Related.source_id AS a,
      Related.target_id AS b
    FROM
      t_3_Related AS Related
   UNION ALL
  
    SELECT
      t_15_Related.target_id AS a,
      t_15_Related.source_id AS b
    FROM
      t_3_Related AS t_15_Related
  
) AS UNUSED_TABLE_NAME  ),
t_1_Link AS (SELECT
  Link_MultBodyAggAux.a AS a,
  Link_MultBodyAggAux.b AS b
FROM
  t_2_Link_MultBodyAggAux AS Link_MultBodyAggAux
GROUP BY 1, 2),
t_0_Near_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Link.b AS person_id
    FROM
      t_1_Link AS Link
    WHERE
      (Link.b != 4) AND
      (Link.a = 4)
   UNION ALL
  
    SELECT
      t_26_Link.b AS person_id
    FROM
      t_1_Link AS t_25_Link, t_1_Link AS t_26_Link
    WHERE
      (t_26_Link.b != 4) AND
      (t_25_Link.a = 4) AND
      (t_26_Link.a = t_25_Link.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Near_MultBodyAggAux.person_id AS person_id
FROM
  t_0_Near_MultBodyAggAux AS Near_MultBodyAggAux
GROUP BY 1 ORDER BY person_id NULLS LAST;