WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      5 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'c' AS g,
      9 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_S AS (SELECT
  V.g AS g,
  SUM(V.x) AS t
FROM
  t_1_V AS V
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_S AS S
WHERE
  (S.t > 2);