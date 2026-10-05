WITH t_3_Employee AS (SELECT * FROM VALUES
  (1, "Alice", 3),
  (2, "Bob", 3),
  (3, "Charlie", 4),
  (4, "David", 4)
AS UNUSED_TABLE_NAME(id, name, manager_id)),
t_0_ManagerPairs AS (SELECT
  t_1_Employee.name AS employee,
  t_2_Employee.name AS manager
FROM
  t_3_Employee AS t_1_Employee, t_3_Employee AS t_2_Employee
WHERE
  (t_2_Employee.id = t_1_Employee.manager_id) ORDER BY employee NULLS LAST)
SELECT
  ManagerPairs.employee AS employee,
  ManagerPairs.manager AS manager
FROM
  t_0_ManagerPairs AS ManagerPairs ORDER BY employee NULLS LAST;