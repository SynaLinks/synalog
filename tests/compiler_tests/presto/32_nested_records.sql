WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      CAST(ROW(CAST(ROW('alice@example.com', '123') AS ROW(email varchar, phone varchar)), 'Alice') AS ROW(contact ROW(email varchar, phone varchar), name varchar)) AS info
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(ROW(CAST(ROW('bob@example.com', '456') AS ROW(email varchar, phone varchar)), 'Bob') AS ROW(contact ROW(email varchar, phone varchar), name varchar)) AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  Person.info.name AS name,
  Person.info.contact.email AS email
FROM
  t_0_Person AS Person ORDER BY id;