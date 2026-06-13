WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      "John" AS col0,
      "Doe" AS col1
   UNION ALL
  
    SELECT
      "Jane" AS col0,
      "Smith" AS col1
   UNION ALL
  
    SELECT
      "Bob" AS col0,
      "" AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.col0 AS first,
  Person.col1 AS last,
  (CONCAT((CONCAT(Person.col0, " ")), Person.col1)) AS full_name
FROM
  t_0_Person AS Person ORDER BY full_name;