WITH t_0_C AS (SELECT
  x_4 AS g,
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY("a", "a", "a", "b", "c", "c")) AS x_4) AS pushkin
GROUP BY 1)
SELECT
  MAX(C.n) AS m
FROM
  t_0_C AS C;