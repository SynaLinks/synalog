WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  V.k AS k,
  CASE WHEN (V.x IS null) THEN null WHEN (V.x < 6) THEN "low" WHEN (V.x < 100) THEN "mid" ELSE "high" END AS b
FROM
  t_0_V AS V ORDER BY k NULLS LAST;