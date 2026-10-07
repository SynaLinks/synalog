WITH t_1_R AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 5)
AS UNUSED_TABLE_NAME(k, v)),
t_0_G AS (SELECT
  R.k AS k
FROM
  t_1_R AS R
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_G AS G;