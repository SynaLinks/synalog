WITH t_1_L AS (SELECT
  ARRAY_AGG(x_8) AS l
FROM
  LATERAL (SELECT explode(ARRAY(3, 5)) AS x_8) AS pushkin)
SELECT
  x_3 AS x
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_3) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 3)) AS x_5) AS pushkin
WHERE
  (x_5 = x_3);