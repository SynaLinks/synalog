WITH t_1_U AS (SELECT * FROM VALUES
  ("ann", 31),
  ("bob", 25),
  ("cid", 40),
  ("dee", 19),
  ("eve", 52),
  ("fay", 28),
  ("gus", 35)
AS UNUSED_TABLE_NAME(u, age))
SELECT
  t_0_U.u AS u
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_U AS t_3_U
  WHERE
    (t_3_U.age >= 20) AND
    (t_3_U.age <= 30) AND
    (t_0_U.u = t_3_U.u)) IS NULL) ORDER BY u NULLS LAST;