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
t_0_T AS (SELECT * FROM (
  
    SELECT
      Emp.name AS name,
      STRUCT(Emp.city AS tag) AS r
    FROM
      t_1_Emp AS Emp
    WHERE
      (Emp.dept = "sales")
   UNION ALL
  
    SELECT
      t_2_Emp.name AS name,
      STRUCT(t_2_Emp.dept AS tag) AS r
    FROM
      t_1_Emp AS t_2_Emp
    WHERE
      (t_2_Emp.salary > 9000)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.name AS name,
  T.r.tag AS tag
FROM
  t_0_T AS T ORDER BY name NULLS LAST, tag NULLS LAST;
