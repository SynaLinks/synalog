WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      "a" AS k,
      1 AS v
   UNION ALL
  
    SELECT
      "a" AS k,
      2 AS v
   UNION ALL
  
    SELECT
      "a" AS k,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.k AS k,
  SUM(P.v) AS t
FROM
  t_0_P AS P
GROUP BY 1;