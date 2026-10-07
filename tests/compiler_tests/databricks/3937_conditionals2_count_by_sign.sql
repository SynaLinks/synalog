WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  CASE WHEN (V.x IS null) THEN null WHEN (V.x > 0) THEN 1 WHEN (V.x < 0) THEN -1 ELSE 0 END AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g NULLS LAST;