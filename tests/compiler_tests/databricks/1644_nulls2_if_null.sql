WITH t_0_Person AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "bob", null),
  (3, "cid", 25),
  (4, null, 40),
  (5, "eve", null)
AS UNUSED_TABLE_NAME(id, name, age))
SELECT
  Person.id AS id,
  CASE WHEN (Person.age IS NULL) THEN "unknown" ELSE "known" END AS s
FROM
  t_0_Person AS Person ORDER BY id NULLS LAST, s NULLS LAST;
