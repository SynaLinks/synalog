WITH t_0_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  SUM(((E.a) * (E.b))) AS t
FROM
  t_0_E AS E;