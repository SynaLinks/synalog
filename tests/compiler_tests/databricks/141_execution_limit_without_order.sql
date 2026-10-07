WITH t_0_Two AS (SELECT
  x_4 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin LIMIT 2)
SELECT
  SUM(1) AS n
FROM
  t_0_Two AS Two;