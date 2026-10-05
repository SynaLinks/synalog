WITH t_0_V AS (SELECT * FROM VALUES
  (1, "cat"),
  (1, "ant"),
  (1, "bee")
AS UNUSED_TABLE_NAME(g, s))
SELECT
  V.g AS g,
  MIN(V.s) AS lo,
  MAX(V.s) AS hi
FROM
  t_0_V AS V
GROUP BY 1;