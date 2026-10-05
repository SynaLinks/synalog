SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5)) AS x_3) AS pushkin
WHERE
  (x_3 > 2) AND
  (x_3 <= 4) ORDER BY x NULLS LAST;