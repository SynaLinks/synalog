WITH t_0_V AS (SELECT * FROM VALUES
  ("a", 3),
  ("b", 9),
  ("c", 1),
  ("d", 5)
AS UNUSED_TABLE_NAME(n, s))
SELECT
  (SELECT
  MIN(V.s) AS logica_value
FROM
  t_0_V AS V
WHERE
  (V.s > 1)) AS t;