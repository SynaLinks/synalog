SELECT
  x_3 AS w
FROM
  LATERAL (SELECT explode(ARRAY("Apple", "kiwi", "Banana")) AS x_3) AS pushkin
WHERE
  (CAST(x_3 AS STRING) LIKE "A%");