WITH t_0_R AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("a", 2),
  ("b", 5)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  R.k AS k,
  COUNT(DISTINCT R.v) AS n
FROM
  t_0_R AS R
GROUP BY 1 ORDER BY k NULLS LAST;