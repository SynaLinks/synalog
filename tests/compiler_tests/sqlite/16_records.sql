WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('name', 'Alice', 'age', 30) AS info
   UNION ALL
  
    SELECT
      JSON_OBJECT('name', 'Bob', 'age', 25) AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(Person.info, "$.name") AS name
FROM
  t_0_Person AS Person ORDER BY name;