SELECT
  x_3 AS t,
  SIZE(SPLIT(x_3, " ")) AS n
FROM
  LATERAL (SELECT explode(ARRAY("hello", "a b c")) AS x_3) AS pushkin ORDER BY t NULLS LAST;