SELECT
  x_3 AS s
FROM
  LATERAL (SELECT explode(ARRAY("abc", "abcd")) AS x_3) AS pushkin
WHERE
  (CAST(x_3 AS STRING) LIKE "abc" ESCAPE '\\');
