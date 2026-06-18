WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      STRUCT("Alice" AS name, STRUCT("alice@example.com" AS email, "123" AS phone) AS contact) AS info
   UNION ALL
  
    SELECT
      2 AS id,
      STRUCT("Bob" AS name, STRUCT("bob@example.com" AS email, "456" AS phone) AS contact) AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  Person.info.name AS name,
  Person.info.contact.email AS email
FROM
  t_0_Person AS Person ORDER BY id;