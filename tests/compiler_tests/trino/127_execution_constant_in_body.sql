WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      'paris' AS city
   UNION ALL
  
    SELECT
      'bob' AS name,
      'rome' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.name AS name
FROM
  t_0_Person AS Person
WHERE
  (Person.city = 'paris');