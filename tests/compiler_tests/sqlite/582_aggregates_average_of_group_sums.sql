WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      3 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_S AS (SELECT
  V.g AS g,
  SUM(V.x) AS t
FROM
  t_1_V AS V
GROUP BY V.g)
SELECT
  AVG(S.t) AS a
FROM
  t_0_S AS S;