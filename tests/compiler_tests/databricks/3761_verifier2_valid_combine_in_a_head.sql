WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_2_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s))
SELECT
  t_0_N.n AS n,
  (SELECT
  SUM(1) AS logica_value
FROM
  t_1_E AS E
WHERE
  (E.a = t_0_N.n)) AS c
FROM
  t_2_N AS t_0_N ORDER BY n NULLS LAST;