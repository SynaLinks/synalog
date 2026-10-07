WITH t_0_V AS (SELECT * FROM VALUES
  ("a", 1, 1),
  ("a", 1, 2),
  ("a", 2, 4),
  ("b", 1, 5)
AS UNUSED_TABLE_NAME(g, h, x))
SELECT
  V.g AS g,
  V.h AS h,
  SUM(V.x) AS t
FROM
  t_0_V AS V
GROUP BY 1, 2 ORDER BY g NULLS LAST, h NULLS LAST;