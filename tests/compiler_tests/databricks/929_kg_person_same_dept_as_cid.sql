WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_3_Person AS (SELECT
  t_4_Employees.person_id AS person_id,
  t_4_Employees.name AS name,
  t_4_Employees.url AS url
FROM
  t_5_Employees AS t_4_Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_6_Dept AS (SELECT
  t_7_Employees.dept AS dept
FROM
  t_5_Employees AS t_7_Employees
GROUP BY 1),
t_1_InDept AS (SELECT
  Person.person_id AS person_id,
  t_2_Dept.dept AS dept
FROM
  t_3_Person AS Person, t_6_Dept AS t_2_Dept, t_5_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.dept = t_2_Dept.dept)
GROUP BY 1, 2)
SELECT
  t_0_InDept.person_id AS person_id
FROM
  t_1_InDept AS InDept, t_1_InDept AS t_0_InDept
WHERE
  (t_0_InDept.person_id != 3) AND
  (InDept.person_id = 3) AND
  (t_0_InDept.dept = InDept.dept)
GROUP BY 1 ORDER BY person_id NULLS LAST;