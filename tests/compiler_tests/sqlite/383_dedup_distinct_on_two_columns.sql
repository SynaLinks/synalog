WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      1 AS x,
      'a' AS y
   UNION ALL
  
    SELECT
      1 AS x,
      'b' AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x,
  V.y AS y
FROM
  t_0_V AS V
GROUP BY V.x, V.y ORDER BY y;