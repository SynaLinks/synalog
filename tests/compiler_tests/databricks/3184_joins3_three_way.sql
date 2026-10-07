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
AS UNUSED_TABLE_NAME(dept, dname, city)),
t_2_Pr AS (SELECT * FROM VALUES
  (100, 10),
  (101, 10),
  (102, 20),
  (103, 50)
AS UNUSED_TABLE_NAME(pid, dept))
SELECT
  E.name AS name,
  D.dname AS dname,
  Pr.pid AS pid
FROM
  t_0_E AS E, t_1_D AS D, t_2_Pr AS Pr
WHERE
  (D.dept = E.dept) AND
  (Pr.dept = E.dept) ORDER BY name NULLS LAST, dname NULLS LAST, pid NULLS LAST;