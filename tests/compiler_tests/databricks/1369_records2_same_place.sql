WITH t_2_Emp AS (SELECT * FROM VALUES
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
  Emp.name AS a,
  t_1_Emp.name AS b
FROM
  t_2_Emp AS Emp, t_2_Emp AS t_1_Emp
WHERE
  (Emp.name < t_1_Emp.name) AND
  (STRUCT(t_1_Emp.dept AS dept, t_1_Emp.city AS city) = STRUCT(Emp.dept AS dept, Emp.city AS city));
