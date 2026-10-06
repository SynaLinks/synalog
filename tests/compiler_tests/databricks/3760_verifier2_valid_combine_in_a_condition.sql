WITH t_1_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s)),
t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  t_0_N.n AS n
FROM
  t_1_N AS t_0_N
WHERE
  ((SELECT
    SUM(1) AS logica_value
  FROM
    t_2_E AS E
  WHERE
    (E.a = t_0_N.n)) = 1) ORDER BY n NULLS LAST;