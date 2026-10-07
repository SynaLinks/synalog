WITH t_1_V AS (SELECT * FROM (
  
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
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x,
  (SELECT
  MAX(t_0_V.x) AS logica_value
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.g = V.g)) AS m
FROM
  t_1_V AS V ORDER BY g, x;