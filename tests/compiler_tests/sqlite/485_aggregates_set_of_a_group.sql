WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
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
      7 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_S AS (SELECT
  V.g AS g,
  DistinctListAgg(V.x) AS s
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_S.g AS g,
  JSON_ARRAY_LENGTH(t_0_S.s) AS n
FROM
  t_1_S AS t_0_S ORDER BY g NULLS LAST;