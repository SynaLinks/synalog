WITH t_1_Person AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "bob", null),
  (3, "cid", 25),
  (4, null, 40),
  (5, "eve", null)
AS UNUSED_TABLE_NAME(id, name, age)),
t_2_Role AS (SELECT * FROM VALUES
  ("ann", "admin"),
  ("cid", "user"),
  (null, "ghost")
AS UNUSED_TABLE_NAME(name, role))
SELECT
  Person.id AS id,
  t_0_Role.role AS role
FROM
  t_1_Person AS Person, t_2_Role AS t_0_Role
WHERE
  (t_0_Role.name = Person.name) ORDER BY id NULLS LAST, role NULLS LAST;
