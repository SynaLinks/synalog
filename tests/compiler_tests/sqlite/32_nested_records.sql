WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_OBJECT('name', 'Alice', 'contact', JSON_OBJECT('email', 'alice@example.com', 'phone', '123')) AS info
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'Bob', 'contact', JSON_OBJECT('email', 'bob@example.com', 'phone', '456')) AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS col0,
  JSON_EXTRACT(Person.info, "$.name") AS col1,
  JSON_EXTRACT(JSON_EXTRACT(Person.info, "$.contact"), "$.email") AS col2
FROM
  t_0_Person AS Person ORDER BY id;