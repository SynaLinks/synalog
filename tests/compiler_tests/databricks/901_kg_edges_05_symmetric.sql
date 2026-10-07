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
t_6_Mentoring AS (SELECT * FROM VALUES
  (2, 5),
  (1, 4)
AS UNUSED_TABLE_NAME(mentor_id, mentee_id)),
t_1_Mentors AS (SELECT
  Person.person_id AS mentor_id,
  t_2_Person.person_id AS mentee_id
FROM
  t_3_Person AS Person, t_3_Person AS t_2_Person, t_6_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = Person.person_id) AND
  (Mentoring.mentee_id = t_2_Person.person_id)
GROUP BY 1, 2),
t_0_Pair_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Mentors.mentor_id AS a,
      Mentors.mentee_id AS b
    FROM
      t_1_Mentors AS Mentors
   UNION ALL
  
    SELECT
      t_7_Mentors.mentee_id AS a,
      t_7_Mentors.mentor_id AS b
    FROM
      t_1_Mentors AS t_7_Mentors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Pair_MultBodyAggAux.a AS a,
  Pair_MultBodyAggAux.b AS b
FROM
  t_0_Pair_MultBodyAggAux AS Pair_MultBodyAggAux
GROUP BY 1, 2 ORDER BY a NULLS LAST, b NULLS LAST;