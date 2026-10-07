WITH t_0_V AS (SELECT * FROM VALUES
  (1, null),
  (2, 2)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  V.k AS k,
  ((V.x) + (1)) AS y
FROM
  t_0_V AS V ORDER BY k NULLS LAST;