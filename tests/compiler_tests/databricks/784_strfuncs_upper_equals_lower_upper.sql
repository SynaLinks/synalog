SELECT
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY("Apple", "kiwi", "Banana")) AS x_2) AS pushkin
WHERE
  (UPPER(LOWER(x_2)) = UPPER(x_2));