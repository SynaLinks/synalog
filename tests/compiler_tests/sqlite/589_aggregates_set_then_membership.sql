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
      2 AS x
   UNION ALL
  
    SELECT
      'c' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_S AS (SELECT
  V.g AS g,
  DistinctListAgg(V.x) AS s
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_S.g AS g
FROM
  t_1_S AS t_0_S, JSON_EACH(t_0_S.s) as x_3
WHERE
  (2 = x_3.value) ORDER BY g NULLS LAST;