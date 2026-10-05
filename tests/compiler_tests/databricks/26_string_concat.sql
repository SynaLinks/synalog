WITH t_0_Person AS (SELECT * FROM VALUES
  ("John", "Doe"),
  ("Jane", "Smith"),
  ("Bob", "")
AS UNUSED_TABLE_NAME(col0, col1))
SELECT
  Person.col0 AS first,
  Person.col1 AS last,
  (CONCAT((CONCAT(Person.col0, " ")), Person.col1)) AS full_name
FROM
  t_0_Person AS Person ORDER BY full_name NULLS LAST;