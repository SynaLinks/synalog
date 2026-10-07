WITH t_0_D AS (SELECT
  x_4 AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "a ")) AS x_4) AS pushkin
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;