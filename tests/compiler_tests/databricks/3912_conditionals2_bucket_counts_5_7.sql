WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  CASE WHEN (V.x < 5) THEN "low" WHEN (V.x < 7) THEN "mid" ELSE "high" END AS b,
  SUM(1) AS n
FROM
  t_0_V AS V
WHERE
  (V.x IS NOT null)
GROUP BY 1 ORDER BY b NULLS LAST;