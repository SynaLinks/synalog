WITH t_0_Employee AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      'Engineering' AS department,
      75000 AS salary
   UNION ALL
  
    SELECT
      'Bob' AS name,
      'Marketing' AS department,
      65000 AS salary
   UNION ALL
  
    SELECT
      'Charlie' AS name,
      'Engineering' AS department,
      80000 AS salary
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Employee.name AS name
FROM
  t_0_Employee AS Employee
WHERE
  (Employee.department = 'Engineering') ORDER BY name;