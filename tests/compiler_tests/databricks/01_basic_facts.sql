WITH t_0_Employee AS (SELECT * FROM VALUES
  ("Alice", "Engineering", 75000),
  ("Bob", "Marketing", 65000),
  ("Charlie", "Engineering", 80000)
AS UNUSED_TABLE_NAME(name, department, salary))
SELECT
  Employee.name AS name
FROM
  t_0_Employee AS Employee
WHERE
  (Employee.department = "Engineering") ORDER BY name NULLS LAST;