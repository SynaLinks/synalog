SELECT
  SUBSTR(x_2, 1, 2) AS p
FROM
  LATERAL (SELECT explode(ARRAY("apple", "pear")) AS x_2) AS pushkin ORDER BY p NULLS LAST;