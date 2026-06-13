WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      30 AS age
   UNION ALL
  
    SELECT
      'Bob' AS name,
      25 AS age
   UNION ALL
  
    SELECT
      'Charlie' AS name,
      35 AS age
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.name AS name
FROM
  t_0_Person AS Person ORDER BY name;