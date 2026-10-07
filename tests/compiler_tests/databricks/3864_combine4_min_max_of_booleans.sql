WITH t_0_V AS (SELECT * FROM VALUES
  (1, true),
  (1, false),
  (2, true)
AS UNUSED_TABLE_NAME(k, b))
SELECT
  V.k AS k,
  MIN(V.b) AS lo,
  MAX(V.b) AS hi
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY k NULLS LAST;