WITH t_0_V AS (SELECT * FROM VALUES
  (null, 1),
  (null, 2),
  (1, 3)
AS UNUSED_TABLE_NAME(g, x))
SELECT
  V.g AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g nulls first;