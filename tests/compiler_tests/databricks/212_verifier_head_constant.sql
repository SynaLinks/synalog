SELECT
  x_1 AS x,
  "one" AS label
FROM
  LATERAL (SELECT explode(ARRAY(1)) AS x_1) AS pushkin;