WITH t_0_V AS (SELECT * FROM VALUES
  ("a", 3),
  ("b", 9),
  ("c", 1),
  ("d", 5)
AS UNUSED_TABLE_NAME(n, s))
SELECT
  MIN(V.s) AS lo,
  MAX(V.s) AS hi,
  AVG(V.s) AS a
FROM
  t_0_V AS V;