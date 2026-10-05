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
t_0_Span AS (SELECT
  Manages.manager_id AS manager_id,
  SUM(1) AS n
FROM
  t_1_Manages AS Manages
GROUP BY 1)
SELECT
  Span.manager_id AS manager_id,
  Span.n AS n
FROM
  t_0_Span AS Span
WHERE
  (Span.n > 2) ORDER BY manager_id NULLS LAST;