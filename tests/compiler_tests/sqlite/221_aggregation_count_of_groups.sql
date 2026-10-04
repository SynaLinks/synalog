WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_G AS (SELECT
  R.k AS k
FROM
  t_1_R AS R
GROUP BY R.k)
SELECT
  SUM(1) AS n
FROM
  t_0_G AS G;