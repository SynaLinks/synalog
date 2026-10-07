WITH t_0_Person AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "bob", null),
  (3, "cid", 25),
  (4, null, 40),
  (5, "eve", null)
AS UNUSED_TABLE_NAME(id, name, age))
SELECT
  Person.name AS name
FROM
  t_0_Person AS Person
WHERE
  (Person.age IS NULL) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (Person.name IS NULL)) IS NULL) ORDER BY name NULLS LAST;
