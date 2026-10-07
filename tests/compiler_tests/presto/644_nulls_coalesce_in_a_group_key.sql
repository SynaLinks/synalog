WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      null AS g
   UNION ALL
  
    SELECT
      null AS g
   UNION ALL
  
    SELECT
      'x' AS g
  
) AS UNUSED_TABLE_NAME  )
SELECT
  COALESCE(V.g, 'none') AS k,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY k;