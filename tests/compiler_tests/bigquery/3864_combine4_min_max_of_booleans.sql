WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      true AS b
   UNION ALL
  
    SELECT
      1 AS k,
      false AS b
   UNION ALL
  
    SELECT
      2 AS k,
      true AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  MIN(V.b) AS lo,
  MAX(V.b) AS hi
FROM
  t_0_V AS V
GROUP BY k ORDER BY k;