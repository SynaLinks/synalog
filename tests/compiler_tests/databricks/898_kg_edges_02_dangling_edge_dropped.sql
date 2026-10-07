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
t_5_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_0_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_1_Person.person_id AS employee_id
FROM
  t_2_Person AS Person, t_2_Person AS t_1_Person, t_5_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_1_Person.person_id)
GROUP BY 1, 2)
SELECT
  Manages.manager_id AS manager_id,
  Manages.employee_id AS employee_id
FROM
  t_0_Manages AS Manages ORDER BY manager_id NULLS LAST, employee_id NULLS LAST;