WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS h,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      1 AS h,
      2 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS h,
      4 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS h,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.h AS h,
  SUM(V.x) AS t
FROM
  t_0_V AS V
GROUP BY V.g, V.h ORDER BY g, h;