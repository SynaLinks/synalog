WITH t_1_Students AS (SELECT * FROM VALUES
  ("Alice", 85),
  ("Bob", 72)
AS UNUSED_TABLE_NAME(name, grade)),
t_2_Teachers AS (SELECT * FROM VALUES
  ("Prof Smith", "Math"),
  ("Prof Jones", "Science")
AS UNUSED_TABLE_NAME(name, department)),
t_0_People AS (SELECT * FROM (
  
    SELECT
      Students.name AS name,
      "student" AS role
    FROM
      t_1_Students AS Students
   UNION ALL
  
    SELECT
      Teachers.name AS name,
      "teacher" AS role
    FROM
      t_2_Teachers AS Teachers
  
) AS UNUSED_TABLE_NAME  )
SELECT
  People.name AS name,
  People.role AS role
FROM
  t_0_People AS People ORDER BY name NULLS LAST;