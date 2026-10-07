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
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE JSON_GROUP_ARRAY(V.x) END) AS l
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_L.g AS g
FROM
  t_1_L AS t_0_L, JSON_EACH(t_0_L.l) as x_3
WHERE
  (2 = x_3.value);