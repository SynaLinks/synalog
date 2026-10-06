WITH t_0_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss)),
t_1_Pr AS (SELECT * FROM VALUES
  (100, 10),
  (101, 10),
  (102, 20),
  (103, 50)
AS UNUSED_TABLE_NAME(pid, dept))
SELECT
  SUM(1) AS n
FROM
  t_0_E AS E, t_1_Pr AS Pr
WHERE
  (((E.id) * (100)) < Pr.pid);