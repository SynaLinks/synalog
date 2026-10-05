SELECT
  x_3 AS w
FROM
  LATERAL (SELECT explode(ARRAY("apple", "pear")) AS x_3) AS pushkin
WHERE
  (x_3 < "banana");