WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'g' AS g,
      null AS s
   UNION ALL
  
    SELECT
      'h' AS g,
      null AS s
   UNION ALL
  
    SELECT
      'h' AS g,
      'x' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  (CASE WHEN COUNT(V.s) > 0 THEN ARRAY_JOIN(ARRAY_AGG(CAST(V.s AS VARCHAR)), ',') END) AS s
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g;