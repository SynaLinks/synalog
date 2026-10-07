WITH t_0_R AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 5)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  R.k AS k,
  SUM(1) AS n,
  SUM(R.v) AS t,
  MIN(R.v) AS lo,
  MAX(R.v) AS hi
FROM
  t_0_R AS R
GROUP BY 1 ORDER BY k NULLS LAST;