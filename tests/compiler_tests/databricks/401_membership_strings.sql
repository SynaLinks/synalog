SELECT
  x_2 AS s
FROM
  LATERAL (SELECT explode(ARRAY("b", "c")) AS x_2) AS pushkin, LATERAL (SELECT explode(ARRAY("a", "b")) AS x_4) AS pushkin
WHERE
  (x_4 = x_2);