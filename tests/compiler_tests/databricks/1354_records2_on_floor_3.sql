WITH t_1_Emp AS (SELECT * FROM VALUES
  ("ann", "eng", 7000, "paris"),
  ("bob", "eng", 5200, "lyon"),
  ("cid", "ops", 4100, "paris"),
  ("dan", "ops", 3900, "nice"),
  ("eve", "sales", 6100, "lyon"),
  ("fay", "sales", 2800, "paris"),
  ("gus", "hr", 4500, "nice"),
  ("hal", "eng", 9100, "nice")
AS UNUSED_TABLE_NAME(name, dept, salary, city)),
t_2_Floor AS (SELECT * FROM VALUES
  ("eng", 3),
  ("ops", 1),
  ("sales", 2),
  ("hr", 1)
AS UNUSED_TABLE_NAME(dept, floor))
SELECT
  Emp.name AS name
FROM
  t_1_Emp AS Emp, t_2_Floor AS t_0_Floor
WHERE
  (t_0_Floor.dept = Emp.dept) AND
  (t_0_Floor.floor = 3) ORDER BY name NULLS LAST;
