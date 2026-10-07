WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  E.a AS a,
  t_0_E.b AS c
FROM
  t_1_E AS E, t_1_E AS t_0_E
WHERE
  (t_0_E.a = E.b);