WITH t_0_D AS (SELECT * FROM VALUES
  (10, "eng", "paris"),
  (20, "ops", "lyon"),
  (40, "hr", "nice"),
  (null, "temp", "lyon")
AS UNUSED_TABLE_NAME(dept, dname, city)),
t_2_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss)),
t_1_Staffed AS (SELECT
  E.dept AS dept
FROM
  t_2_E AS E
WHERE
  (E.dept IS NOT null)
GROUP BY 1)
SELECT
  D.dname AS dname
FROM
  t_0_D AS D
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Staffed AS Staffed
  WHERE
    (Staffed.dept = D.dept)) IS NULL) ORDER BY dname NULLS LAST;