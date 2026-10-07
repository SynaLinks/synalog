WITH t_1_U AS (SELECT * FROM VALUES
  ("ann", 31),
  ("bob", 25),
  ("cid", 40),
  ("dee", 19),
  ("eve", 52),
  ("fay", 28),
  ("gus", 35)
AS UNUSED_TABLE_NAME(u, age)),
t_2_F AS (SELECT * FROM VALUES
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
  t_0_U.u AS v
FROM
  t_1_U AS t_0_U
WHERE
  (t_0_U.u != "eve") AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_F AS F
  WHERE
    (F.a = "eve") AND
    (F.b = t_0_U.u)) IS NULL) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_F AS t_3_F
  WHERE
    (t_3_F.a = t_0_U.u) AND
    (t_3_F.b = "eve")) IS NULL) ORDER BY v NULLS LAST;