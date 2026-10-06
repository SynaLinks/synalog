WITH t_0_Pr AS (SELECT * FROM VALUES
  (100, 10),
  (101, 10),
  (102, 20),
  (103, 50)
AS UNUSED_TABLE_NAME(pid, dept)),
t_1_D AS (SELECT * FROM VALUES
  (10, "eng", "paris"),
  (20, "ops", "lyon"),
  (40, "hr", "nice"),
  (null, "temp", "lyon")
AS UNUSED_TABLE_NAME(dept, dname, city))
SELECT
  Pr.pid AS pid
FROM
  t_0_Pr AS Pr
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_D AS D
  WHERE
    (D.dept = Pr.dept)) IS NULL);