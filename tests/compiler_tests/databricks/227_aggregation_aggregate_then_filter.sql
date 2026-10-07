WITH t_2_R AS (SELECT * FROM VALUES
  ("a", 10),
  ("a", 20),
  ("b", 5)
AS UNUSED_TABLE_NAME(k, v)),
t_1_T AS (SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_2_R AS R
GROUP BY 1)
SELECT
  t_0_T.k AS k
FROM
  t_1_T AS t_0_T
WHERE
  (t_0_T.t > 10) ORDER BY k NULLS LAST;