SELECT
  x_3 AS w,
  SUBSTR(x_3, 1, 1) AS f
FROM
  LATERAL (SELECT explode(ARRAY("Apple", "kiwi", "Banana")) AS x_3) AS pushkin ORDER BY w NULLS LAST;