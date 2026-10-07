WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      x_4 AS x
    FROM
      UNNEST(ARRAY[4, 1, 7, 1]) as x_4
   UNION ALL
  
    SELECT
      "b" AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  AVG(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY g ORDER BY g NULLS LAST;