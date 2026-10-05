WITH t_2_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_0_Person AS (SELECT
  t_1_Employees.person_id AS person_id,
  t_1_Employees.name AS name,
  t_1_Employees.url AS url
FROM
  t_2_Employees AS t_1_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST)
SELECT
  Person.person_id AS person_id,
  Person.name AS name
FROM
  t_0_Person AS Person, t_2_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.status = "inactive")
GROUP BY 1, 2 ORDER BY person_id NULLS LAST;