WITH t_0_Pr AS (SELECT * FROM VALUES
  (100, 10),
  (101, 10),
  (102, 20),
  (103, 50)
AS UNUSED_TABLE_NAME(pid, dept)),
t_1_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss))
SELECT
  E.name AS name,
  COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_0_Pr AS Pr
WHERE
  (Pr.dept = E.dept)), 0) AS n
FROM
  t_1_E AS E ORDER BY name NULLS LAST, n NULLS LAST;