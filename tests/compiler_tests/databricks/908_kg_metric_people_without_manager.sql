WITH t_1_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_0_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_1_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_6_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  t_3_Person.person_id AS manager_id,
  t_4_Person.person_id AS employee_id
FROM
  t_0_Person AS t_3_Person, t_0_Person AS t_4_Person, t_6_Management AS Management
WHERE
  (Management.manager_id = t_3_Person.person_id) AND
  (Management.employee_id = t_4_Person.person_id)
GROUP BY 1, 2)
SELECT
  Person.person_id AS person_id
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Manages AS Manages
  WHERE
    (Manages.employee_id = Person.person_id)) IS NULL) ORDER BY person_id NULLS LAST;