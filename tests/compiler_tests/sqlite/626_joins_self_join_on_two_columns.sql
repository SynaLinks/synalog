WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x1,
  t_0_V.x AS x2
FROM
  t_1_V AS V, t_1_V AS t_0_V
WHERE
  (V.x < t_0_V.x) AND
  (t_0_V.g = V.g);