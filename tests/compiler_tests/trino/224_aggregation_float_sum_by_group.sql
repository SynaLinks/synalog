WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      0.25E0 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      0.5E0 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      0.5E0 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_0_R AS R
GROUP BY 1 ORDER BY k;