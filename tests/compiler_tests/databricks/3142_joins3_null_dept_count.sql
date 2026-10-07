WITH t_0_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss))
SELECT
  E.dept AS dept,
  SUM(1) AS n
FROM
  t_0_E AS E
GROUP BY 1 ORDER BY dept NULLS LAST, n NULLS LAST;