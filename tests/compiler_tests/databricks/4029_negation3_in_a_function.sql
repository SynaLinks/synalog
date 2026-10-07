WITH t_1_F AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("bob", "cid"),
  ("cid", "dee"),
  ("dee", "cid"),
  ("eve", "ann"),
  ("fay", "fay"),
  ("ann", "cid")
AS UNUSED_TABLE_NAME(a, b)),
t_2_U AS (SELECT * FROM VALUES
  ("ann", 31),
  ("bob", 25),
  ("cid", 40),
  ("dee", 19),
  ("eve", 52),
  ("fay", 28),
  ("gus", 35)
AS UNUSED_TABLE_NAME(u, age))
SELECT
  t_0_U.u AS u,
  COALESCE((SELECT
  MIN(false) AS logica_value
FROM
  t_1_F AS F
WHERE
  (F.a = t_0_U.u)), true) AS l
FROM
  t_2_U AS t_0_U ORDER BY u NULLS LAST;