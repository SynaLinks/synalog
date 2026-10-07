SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 10)) AS x_3) AS pushkin
WHERE
  ((x_3 > 1) AND ((x_3 < 4) OR (x_3 = 10))) ORDER BY x NULLS LAST;