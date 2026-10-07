WITH t_0_R AS (SELECT * FROM VALUES
  ("a", 7),
  ("a", 7)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  R.k AS k,
  MIN(R.v) AS v
FROM
  t_0_R AS R
GROUP BY 1;