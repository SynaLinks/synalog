WITH t_0_Person AS (SELECT * FROM VALUES
  (1, "Ann", "red", 34, true),
  (2, "Bob", "red", null, false),
  (3, "Cid", "blue", 52, true),
  (4, "Dee", "blue", 23, false),
  (5, "Eve", "green", 41, null),
  (6, "Fay", "red", 19, true),
  (7, "Gus", "gold", 60, false)
AS UNUSED_TABLE_NAME(id, name, team, age, active))
SELECT
  Person.id AS id
FROM
  t_0_Person AS Person
WHERE
  (Person.active OR (Person.age >= 40)) ORDER BY id NULLS LAST;