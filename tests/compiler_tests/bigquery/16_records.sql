WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      STRUCT("Alice" AS name, 30 AS age) AS info
   UNION ALL
  
    SELECT
      STRUCT("Bob" AS name, 25 AS age) AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.info.name AS name
FROM
  t_0_Person AS Person ORDER BY name;