SELECT
  x_3 AS w
FROM
  LATERAL (SELECT explode(ARRAY("cat", "cart", "scat", "Cat", "ct", "c_t")) AS x_3) AS pushkin
WHERE
  (CAST(x_3 AS STRING) LIKE "c%" ESCAPE '\\') ORDER BY w NULLS LAST;
