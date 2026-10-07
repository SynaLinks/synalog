WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS name,
      30 AS age
   UNION ALL
  
    SELECT
      2 AS id,
      "bob" AS name,
      null AS age
   UNION ALL
  
    SELECT
      3 AS id,
      "cid" AS name,
      25 AS age
   UNION ALL
  
    SELECT
      4 AS id,
      null AS name,
      40 AS age
   UNION ALL
  
    SELECT
      5 AS id,
      "eve" AS name,
      null AS age
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(Person.age) AS s
FROM
  t_0_Person AS Person
WHERE
  (Person.age IS NULL);