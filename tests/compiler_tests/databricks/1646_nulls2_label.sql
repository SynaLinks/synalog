WITH t_0_Person AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "bob", null),
  (3, "cid", 25),
  (4, null, 40),
  (5, "eve", null)
AS UNUSED_TABLE_NAME(id, name, age))
SELECT
  Person.id AS id,
  COALESCE(Person.name, "?") AS label
FROM
  t_0_Person AS Person ORDER BY id NULLS LAST, label NULLS LAST;
