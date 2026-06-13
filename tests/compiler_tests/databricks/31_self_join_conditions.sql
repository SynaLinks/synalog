WITH t_2_Employee AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "Alice" AS name,
      3 AS manager_id
   UNION ALL
  
    SELECT
      2 AS id,
      "Bob" AS name,
      3 AS manager_id
   UNION ALL
  
    SELECT
      3 AS id,
      "Charlie" AS name,
      4 AS manager_id
   UNION ALL
  
    SELECT
      4 AS id,
      "David" AS name,
      4 AS manager_id
  
) AS UNUSED_TABLE_NAME  ),
t_0_ManagerPairs AS (SELECT
  Employee.name AS employee,
  t_1_Employee.name AS manager
FROM
  t_2_Employee AS Employee, t_2_Employee AS t_1_Employee
WHERE
  (t_1_Employee.id = Employee.manager_id) ORDER BY employee)
SELECT
  ManagerPairs.employee AS employee,
  ManagerPairs.manager AS manager
FROM
  t_0_ManagerPairs AS ManagerPairs ORDER BY employee;