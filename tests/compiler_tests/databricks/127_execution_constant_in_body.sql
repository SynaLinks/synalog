WITH t_0_Person AS (SELECT * FROM VALUES
  ("ann", "paris"),
  ("bob", "rome")
AS UNUSED_TABLE_NAME(name, city))
SELECT
  Person.name AS name
FROM
  t_0_Person AS Person
WHERE
  (Person.city = "paris");