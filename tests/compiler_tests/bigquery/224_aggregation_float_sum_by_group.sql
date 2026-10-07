WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      "a" AS k,
      0.25 AS v
   UNION ALL
  
    SELECT
      "a" AS k,
      0.5 AS v
   UNION ALL
  
    SELECT
      "b" AS k,
      0.5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_0_R AS R
GROUP BY k ORDER BY k;