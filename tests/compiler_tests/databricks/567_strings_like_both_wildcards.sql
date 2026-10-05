SELECT
  x_3 AS w
FROM
  LATERAL (SELECT explode(ARRAY("cake", "bakery", "cookie")) AS x_3) AS pushkin
WHERE
  (CAST(x_3 AS STRING) LIKE "%a_e%") ORDER BY w NULLS LAST;