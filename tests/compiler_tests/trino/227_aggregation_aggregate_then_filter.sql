WITH t_2_R AS (SELECT * FROM (
  
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
  (t_0_T.t > 10) ORDER BY k;