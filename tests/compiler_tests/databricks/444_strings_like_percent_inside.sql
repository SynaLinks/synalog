SELECT
  x_3 AS w
FROM
  LATERAL (SELECT explode(ARRAY("abc", "axyzc", "abd")) AS x_3) AS pushkin
WHERE
  (CAST(x_3 AS STRING) LIKE "a%c" ESCAPE '\\') ORDER BY w NULLS LAST;
