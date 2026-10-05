WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      1 AS x
   UNION ALL
  
    SELECT
      "a" AS g,
      2 AS x
   UNION ALL
  
    SELECT
      "b" AS g,
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
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_3) AS pushkin
WHERE
  (2 = x_3);