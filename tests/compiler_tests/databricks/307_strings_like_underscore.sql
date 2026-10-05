SELECT
  x_3 AS w
FROM
  LATERAL (SELECT explode(ARRAY("abc", "abbc", "ac")) AS x_3) AS pushkin
WHERE
  (CAST(x_3 AS STRING) LIKE "a_c" ESCAPE '\\') ORDER BY w NULLS LAST;
