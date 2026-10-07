WITH t_1_U AS (SELECT * FROM VALUES
  ("ann", 31),
  ("bob", 25),
  ("cid", 40),
  ("dee", 19),
  ("eve", 52),
  ("fay", 28),
  ("gus", 35)
AS UNUSED_TABLE_NAME(u, age)),
t_6_F AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("bob", "cid"),
  ("cid", "dee"),
  ("dee", "cid"),
  ("eve", "ann"),
  ("fay", "fay"),
  ("ann", "cid")
AS UNUSED_TABLE_NAME(a, b)),
t_4_N1 AS (SELECT
  t_5_U.u AS v
FROM
  t_1_U AS t_5_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_6_F AS F
  WHERE
    (F.a = "gus") AND
    (F.b = t_5_U.u)) IS NULL)),
t_2_N2 AS (SELECT
  t_3_U.u AS v
FROM
  t_1_U AS t_3_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_4_N1 AS N1
  WHERE
    (N1.v = t_3_U.u)) IS NULL))
SELECT
  t_0_U.u AS v
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_N2 AS N2
  WHERE
    (N2.v = t_0_U.u)) IS NULL) ORDER BY v NULLS LAST;