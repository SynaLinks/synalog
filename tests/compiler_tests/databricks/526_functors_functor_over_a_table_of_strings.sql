SELECT
  UPPER(x_4) AS u
FROM
  LATERAL (SELECT explode(ARRAY("a", "b")) AS x_4) AS pushkin ORDER BY u NULLS LAST;