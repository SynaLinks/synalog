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
  Emp.name AS name
FROM
  t_0_Emp AS Emp
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_Emp AS t_1_Emp
  WHERE
    (t_1_Emp.dept = "eng") AND
    (t_1_Emp.city = "paris") AND
    (Emp.name = t_1_Emp.name)) IS NULL) ORDER BY name NULLS LAST;
