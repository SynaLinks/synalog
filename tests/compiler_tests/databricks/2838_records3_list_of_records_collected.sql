WITH t_2_V AS (SELECT * FROM VALUES
  ("x", 1),
  ("x", 2),
  ("y", 3)
AS UNUSED_TABLE_NAME(g, n)),
t_1_C AS (SELECT
  V.g AS g,
  ARRAY_AGG(STRUCT(V.n AS n)) AS l
FROM
  t_2_V AS V
GROUP BY 1)
SELECT
  t_0_C.g AS g,
  SUM(1) AS c
FROM
  t_1_C AS t_0_C, LATERAL (SELECT explode(t_0_C.l) AS x_3) AS pushkin
WHERE
  (x_3.n > 0)
GROUP BY 1 ORDER BY g NULLS LAST;