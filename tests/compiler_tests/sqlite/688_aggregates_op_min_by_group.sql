WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      x_4.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(4, 1, 7, 1)) as x_4
   UNION ALL
  
    SELECT
      'b' AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  MIN(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY t_0_V.g ORDER BY g NULLS LAST;