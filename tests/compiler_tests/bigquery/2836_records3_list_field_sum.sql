WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      STRUCT("a" AS name, ARRAY[1, 2, 3] AS xs) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      STRUCT("b" AS name, ARRAY[4] AS xs) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      STRUCT("c" AS name, ARRAY[] AS xs) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.r.name AS name,
  SUM(x_1) AS t
FROM
  t_0_S AS S, UNNEST(S.r.xs) as x_1
GROUP BY name ORDER BY name;