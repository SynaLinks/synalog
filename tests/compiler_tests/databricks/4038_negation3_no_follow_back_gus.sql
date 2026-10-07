WITH t_1_U AS (SELECT * FROM VALUES
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
  1 AS x
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_F AS F, t_3_F AS t_2_F
  WHERE
    (F.a = "gus") AND
    (t_2_F.a = F.b) AND
    (t_2_F.b = "gus")) IS NULL) AND
  (t_0_U.u = "gus");