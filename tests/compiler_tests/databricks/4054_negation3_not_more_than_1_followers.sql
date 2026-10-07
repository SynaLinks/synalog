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
t_3_C AS (SELECT
  F.b AS b,
  SUM(1) AS n
FROM
  t_4_F AS F
GROUP BY 1),
t_2_Popular AS (SELECT
  C.b AS u
FROM
  t_3_C AS C
WHERE
  (C.n > 1)
GROUP BY 1)
SELECT
  t_0_U.u AS u
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Popular AS Popular
  WHERE
    (Popular.u = t_0_U.u)) IS NULL) ORDER BY u NULLS LAST;