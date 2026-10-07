SELECT
  "a" AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "b")) AS x_3) AS pushkin
WHERE
  (x_3 = "a") AND
  ("a" = "b");
