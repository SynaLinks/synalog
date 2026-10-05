SELECT
  x_3 AS d
FROM
  LATERAL (SELECT explode(ARRAY("2024-01-31", "2024-02-15", "2024-03-01")) AS x_3) AS pushkin
WHERE
  (x_3 >= "2024-02-01") AND
  (x_3 < "2024-03-01");