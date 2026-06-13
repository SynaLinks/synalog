WITH t_1_Students AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      85 AS grade
   UNION ALL
  
    SELECT
      'Bob' AS name,
      72 AS grade
  
) AS UNUSED_TABLE_NAME  ),
t_2_Teachers AS (SELECT * FROM (
  
    SELECT
      'Prof Smith' AS name,
      'Math' AS department
   UNION ALL
  
    SELECT
      'Prof Jones' AS name,
      'Science' AS department
  
) AS UNUSED_TABLE_NAME  ),
t_0_People AS (SELECT * FROM (
  
    SELECT
      Students.name AS name,
      'student' AS role
    FROM
      t_1_Students AS Students
   UNION ALL
  
    SELECT
      Teachers.name AS name,
      'teacher' AS role
    FROM
      t_2_Teachers AS Teachers
  
) AS UNUSED_TABLE_NAME  )
SELECT
  People.name AS name,
  People.role AS role
FROM
  t_0_People AS People ORDER BY name;