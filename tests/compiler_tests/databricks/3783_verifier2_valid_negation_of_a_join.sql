WITH t_1_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s)),
t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  t_0_N.n AS n
FROM
  t_1_N AS t_0_N
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_E AS E, t_1_N AS t_2_N
  WHERE
    (E.a = t_0_N.n) AND
    (t_2_N.n = E.b)) IS NULL);