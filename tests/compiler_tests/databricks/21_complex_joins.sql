WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "Alice" AS name,
      101 AS dept
   UNION ALL
  
    SELECT
      2 AS id,
      "Bob" AS name,
      102 AS dept
   UNION ALL
  
    SELECT
      3 AS id,
      "Charlie" AS name,
      101 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_Departments AS (SELECT * FROM (
  
    SELECT
      101 AS id,
      "Engineering" AS name
   UNION ALL
  
    SELECT
      102 AS id,
      "Marketing" AS name
   UNION ALL
  
    SELECT
      103 AS id,
      "Sales" AS name
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.name AS user_name,
  Departments.name AS dept_name
FROM
  t_0_Users AS Users, t_1_Departments AS Departments
WHERE
  (Departments.id = Users.dept) ORDER BY user_name;