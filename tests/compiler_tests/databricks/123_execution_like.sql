SELECT
  x_3 AS w
FROM
  LATERAL (SELECT explode(ARRAY("apple", "banana", "apricot")) AS x_3) AS pushkin
WHERE
  (CAST(x_3 AS STRING) LIKE "ap%" ESCAPE '\\') ORDER BY w NULLS LAST;
