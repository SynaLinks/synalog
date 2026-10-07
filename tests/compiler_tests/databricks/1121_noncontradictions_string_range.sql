SELECT
  x_3 AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "b", "c")) AS x_3) AS pushkin
WHERE
  (x_3 > "a") AND
  (x_3 < "c");
