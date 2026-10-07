WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      x_4 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[4, 1, 7, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
   UNION ALL
  
    SELECT
      'b' AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  MAX(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY 1 ORDER BY g;