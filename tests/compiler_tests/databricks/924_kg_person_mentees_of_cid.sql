WITH t_3_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_2_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_3_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_5_Mentoring AS (SELECT * FROM VALUES
  (2, 5),
  (1, 4)
AS UNUSED_TABLE_NAME(mentor_id, mentee_id)),
t_0_Mentors AS (SELECT
  Person.person_id AS mentor_id,
  t_1_Person.person_id AS mentee_id
FROM
  t_2_Person AS Person, t_2_Person AS t_1_Person, t_5_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = Person.person_id) AND
  (Mentoring.mentee_id = t_1_Person.person_id)
GROUP BY 1, 2)
SELECT
  Mentors.mentee_id AS mentee_id
FROM
  t_0_Mentors AS Mentors
WHERE
  (Mentors.mentor_id = 3)
GROUP BY 1 ORDER BY mentee_id NULLS LAST;