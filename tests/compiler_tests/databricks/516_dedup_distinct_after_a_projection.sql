WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      1 AS x
   UNION ALL
  
    SELECT
      "a" AS g,
      2 AS x
   UNION ALL
  
    SELECT
      "b" AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g;