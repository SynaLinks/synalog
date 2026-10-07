WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      "g" AS g,
      null AS s
   UNION ALL
  
    SELECT
      "h" AS g,
      null AS s
   UNION ALL
  
    SELECT
      "h" AS g,
      "x" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  STRING_AGG(CAST(V.s AS STRING), ',') AS s
FROM
  t_0_V AS V
GROUP BY g ORDER BY g;