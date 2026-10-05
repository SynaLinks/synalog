SELECT
  x_11 AS x,
  (POW(x_11, 2)) AS squared,
  (POW(x_11, 3)) AS cubed
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_11) AS pushkin
WHERE
  (x_11 > 0) AND
  (x_11 < 5) ORDER BY x NULLS LAST;