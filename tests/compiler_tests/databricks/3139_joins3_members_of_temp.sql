WITH t_0_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss)),
t_1_D AS (SELECT * FROM VALUES
  (10, "eng", "paris"),
  (20, "ops", "lyon"),
  (40, "hr", "nice"),
  (null, "temp", "lyon")
AS UNUSED_TABLE_NAME(dept, dname, city))
SELECT
  E.name AS name
FROM
  t_0_E AS E, t_1_D AS D
WHERE
  (D.dept = E.dept) AND
  (D.dname = "temp");