SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("x' OR '1'='1", "other")) AS x_1) AS pushkin
WHERE
  (NOT (x_1 <=> "other"));
