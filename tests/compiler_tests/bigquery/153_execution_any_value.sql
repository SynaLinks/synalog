WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      "a" AS k,
      7 AS v
   UNION ALL
  
    SELECT
      "a" AS k,
      7 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  MIN(R.v) AS v
FROM
  t_0_R AS R
GROUP BY k;