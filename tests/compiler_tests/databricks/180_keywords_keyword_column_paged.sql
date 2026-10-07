SELECT
  x_1 AS `order`
FROM
  LATERAL (SELECT explode(ARRAY(2, 3, 1, 4)) AS x_1) AS pushkin ORDER BY `order` NULLS LAST;