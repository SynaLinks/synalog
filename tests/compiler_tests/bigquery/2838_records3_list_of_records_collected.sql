WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      "x" AS g,
      1 AS n
   UNION ALL
  
    SELECT
      "x" AS g,
      2 AS n
   UNION ALL
  
    SELECT
      "y" AS g,
      3 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  V.g AS g,
  ARRAY_AGG(STRUCT(V.n AS n)) AS l
FROM
  t_2_V AS V
GROUP BY g)
SELECT
  t_0_C.g AS g,
  SUM(1) AS c
FROM
  t_1_C AS t_0_C, UNNEST(t_0_C.l) as x_3
WHERE
  (x_3.n > 0)
GROUP BY g ORDER BY g NULLS LAST;