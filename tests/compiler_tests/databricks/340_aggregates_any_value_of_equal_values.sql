WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      "g" AS g,
      7 AS x
   UNION ALL
  
    SELECT
      "g" AS g,
      7 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  MIN(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY 1;