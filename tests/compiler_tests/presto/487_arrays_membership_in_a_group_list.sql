WITH t_2_V AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  V.g AS g,
  ARRAY_AGG(V.x) AS l
FROM
  t_2_V AS V
GROUP BY 1)
SELECT
  t_0_L.g AS g
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as pushkin(x_3)
WHERE
  (2 = x_3);