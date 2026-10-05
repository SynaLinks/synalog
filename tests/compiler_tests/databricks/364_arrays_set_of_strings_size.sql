WITH t_1_L AS (SELECT
  ARRAY_AGG(DISTINCT x_3) AS l
FROM
  LATERAL (SELECT explode(ARRAY("x", "y", "x")) AS x_3) AS pushkin)
SELECT
  SIZE(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;