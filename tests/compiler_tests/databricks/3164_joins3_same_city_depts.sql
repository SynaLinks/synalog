WITH t_1_D AS (SELECT * FROM VALUES
  (10, "eng", "paris"),
  (20, "ops", "lyon"),
  (40, "hr", "nice"),
  (null, "temp", "lyon")
AS UNUSED_TABLE_NAME(dept, dname, city))
SELECT
  D.dname AS a,
  t_0_D.dname AS b
FROM
  t_1_D AS D, t_1_D AS t_0_D
WHERE
  (D.dname < t_0_D.dname) AND
  (t_0_D.city = D.city);