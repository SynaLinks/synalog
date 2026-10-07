WITH t_0_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 5),
  ("b", 6),
  ("b", 7)
AS UNUSED_TABLE_NAME(g, x))
SELECT
  V.g AS g,
  SUM(CASE WHEN (V.x > 4) THEN 1 ELSE 0 END) AS n
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g NULLS LAST;