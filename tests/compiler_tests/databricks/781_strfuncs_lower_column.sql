SELECT
  x_3 AS w,
  LOWER(x_3) AS u
FROM
  LATERAL (SELECT explode(ARRAY("Apple", "kiwi", "Banana")) AS x_3) AS pushkin ORDER BY w NULLS LAST;