WITH t_0_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  E.a AS a
FROM
  t_0_E AS E
WHERE
  (true = (E.a > 1));