WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      "p" AS n,
      1 AS x
   UNION ALL
  
    SELECT
      "a" AS g,
      "q" AS n,
      5 AS x
   UNION ALL
  
    SELECT
      "b" AS g,
      "r" AS n,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_M AS (SELECT
  t_3_V.g AS g,
  MAX(t_3_V.x) AS m
FROM
  t_1_V AS t_3_V
GROUP BY 1)
SELECT
  V.g AS g,
  V.n AS n
FROM
  t_1_V AS V, t_2_M AS t_0_M
WHERE
  (t_0_M.g = V.g) AND
  (t_0_M.m = V.x) ORDER BY g NULLS LAST;