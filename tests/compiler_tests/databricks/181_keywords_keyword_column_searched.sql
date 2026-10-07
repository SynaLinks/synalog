SELECT
  x_1 AS `group`
FROM
  LATERAL (SELECT explode(ARRAY("a", "b")) AS x_1) AS pushkin ORDER BY `group` NULLS LAST;