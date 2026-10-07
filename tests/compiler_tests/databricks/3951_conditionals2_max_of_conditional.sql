WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  MAX(CASE WHEN (V.x > 0) THEN ((V.x) * (2)) ELSE ((V.x) - (1)) END) AS m
FROM
  t_0_V AS V;