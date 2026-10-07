WITH t_0_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  CASE WHEN (V.x > 0) THEN 1 WHEN (V.x < 0) THEN -1 ELSE 0 END AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g NULLS LAST;