SELECT
  "a" AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "A")) AS x_3) AS pushkin
WHERE
  (x_3 = "a");