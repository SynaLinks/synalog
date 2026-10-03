WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  COUNT(DISTINCT R.v) AS n
FROM
  t_0_R AS R
GROUP BY R.k ORDER BY k;