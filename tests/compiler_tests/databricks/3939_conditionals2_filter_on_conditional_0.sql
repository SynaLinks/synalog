WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  (CASE WHEN (V.x < 0) THEN 0 WHEN (V.x > 10) THEN 10 ELSE V.x END > 0) ORDER BY k NULLS LAST;