SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(0, 1, 2, 4)) AS x_3) AS pushkin
WHERE
  (x_3 = ((x_3) * (x_3))) ORDER BY x NULLS LAST;
