WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss))
SELECT
  E.name AS name
FROM
  t_1_E AS E, t_1_E AS t_0_E
WHERE
  (t_0_E.id = E.boss) AND
  (t_0_E.name = "dee");