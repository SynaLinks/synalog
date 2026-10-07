WITH t_2_U AS (SELECT * FROM VALUES
  ("ann", 31),
  ("bob", 25),
  ("cid", 40),
  ("dee", 19),
  ("eve", 52),
  ("fay", 28),
  ("gus", 35)
AS UNUSED_TABLE_NAME(u, age)),
t_3_F AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("bob", "cid"),
  ("cid", "dee"),
  ("dee", "cid"),
  ("eve", "ann"),
  ("fay", "fay"),
  ("ann", "cid")
AS UNUSED_TABLE_NAME(a, b))
SELECT
  t_0_U.u AS a,
  t_1_U.u AS b
FROM
  t_2_U AS t_0_U, t_2_U AS t_1_U
WHERE
  (t_0_U.u < t_1_U.u) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_F AS F
  WHERE
    (F.a = t_0_U.u) AND
    (F.b = t_1_U.u)) IS NULL) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_F AS t_4_F
  WHERE
    (t_4_F.a = t_1_U.u) AND
    (t_4_F.b = t_0_U.u)) IS NULL) ORDER BY a NULLS LAST, b NULLS LAST;