WITH t_1_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  V.k AS k,
  CASE WHEN (V.x > 12) THEN "up" ELSE "down" END AS d
FROM
  t_1_V AS V ORDER BY k NULLS LAST;