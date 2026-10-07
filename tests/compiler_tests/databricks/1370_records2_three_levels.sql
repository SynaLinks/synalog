WITH t_0_Emp AS (SELECT * FROM VALUES
  ("ann", "eng", 7000, "paris"),
  ("bob", "eng", 5200, "lyon"),
  ("cid", "ops", 4100, "paris"),
  ("dan", "ops", 3900, "nice"),
  ("eve", "sales", 6100, "lyon"),
  ("fay", "sales", 2800, "paris"),
  ("gus", "hr", 4500, "nice"),
  ("hal", "eng", 9100, "nice")
AS UNUSED_TABLE_NAME(name, dept, salary, city))
SELECT
  Emp.name AS name,
  STRUCT(STRUCT(Emp.salary AS c) AS b).b.c AS c
FROM
  t_0_Emp AS Emp
WHERE
  (STRUCT(STRUCT(Emp.salary AS c) AS b).b.c > 6000) ORDER BY name NULLS LAST, c NULLS LAST;
