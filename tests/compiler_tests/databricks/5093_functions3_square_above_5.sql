WITH t_0_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  (((V.x) * (V.x)) > 5) ORDER BY k NULLS LAST;