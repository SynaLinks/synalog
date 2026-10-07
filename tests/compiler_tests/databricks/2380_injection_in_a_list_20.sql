SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("{x}; DROP", "other")) AS x_1) AS pushkin
WHERE
  (x_1 != "other");
