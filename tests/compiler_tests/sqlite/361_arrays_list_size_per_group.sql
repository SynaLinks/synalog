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
  JSON_GROUP_ARRAY(V.x) AS l
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_L.g AS g,
  JSON_ARRAY_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY g NULLS LAST;