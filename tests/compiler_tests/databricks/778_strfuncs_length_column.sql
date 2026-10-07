SELECT
  x_3 AS w,
  LENGTH(x_3) AS n
FROM
  LATERAL (SELECT explode(ARRAY("Apple", "kiwi", "Banana")) AS x_3) AS pushkin ORDER BY w NULLS LAST;