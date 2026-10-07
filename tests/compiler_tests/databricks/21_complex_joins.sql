WITH t_0_Users AS (SELECT * FROM VALUES
  (1, "Alice", 101),
  (2, "Bob", 102),
  (3, "Charlie", 101)
AS UNUSED_TABLE_NAME(id, name, dept)),
t_1_Departments AS (SELECT * FROM VALUES
  (101, "Engineering"),
  (102, "Marketing"),
  (103, "Sales")
AS UNUSED_TABLE_NAME(id, name))
SELECT
  Users.name AS user_name,
  Departments.name AS dept_name
FROM
  t_0_Users AS Users, t_1_Departments AS Departments
WHERE
  (Departments.id = Users.dept) ORDER BY user_name NULLS LAST;