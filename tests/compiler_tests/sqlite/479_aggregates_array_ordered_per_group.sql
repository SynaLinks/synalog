WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      2 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS k,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  ArgMin(t_0_V.v, t_0_V.k, null) AS l
FROM
  t_3_V AS t_0_V
GROUP BY t_0_V.g ORDER BY g NULLS LAST;