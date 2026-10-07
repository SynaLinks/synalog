WITH t_1_U AS (SELECT * FROM VALUES
  ("ann", 31),
  ("bob", 25),
  ("cid", 40),
  ("dee", 19),
  ("eve", 52),
  ("fay", 28),
  ("gus", 35)
AS UNUSED_TABLE_NAME(u, age)),
t_4_F AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("bob", "cid"),
  ("cid", "dee"),
  ("dee", "cid"),
  ("eve", "ann"),
  ("fay", "fay"),
  ("ann", "cid")
AS UNUSED_TABLE_NAME(a, b)),
t_2_NotF AS (SELECT
  t_3_U.u AS v
FROM
  t_1_U AS t_3_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_4_F AS F
  WHERE
    (F.a = "dee") AND
    (F.b = t_3_U.u)) IS NULL))
SELECT
  t_0_U.u AS v
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_NotF AS NotF
  WHERE
    (NotF.v = t_0_U.u)) IS NULL) ORDER BY v NULLS LAST;