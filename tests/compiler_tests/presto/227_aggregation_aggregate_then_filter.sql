WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      20 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_T AS (SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_1_R AS R
GROUP BY 1)
SELECT
  T.k AS k
FROM
  t_0_T AS T
WHERE
  (T.t > 10) ORDER BY k;