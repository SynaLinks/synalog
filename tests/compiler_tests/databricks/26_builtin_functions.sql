SELECT
  x_10 AS col0,
  ABS(((x_10) - (5))) AS col1
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_10) AS pushkin
WHERE
  (x_10 > 0) ORDER BY col0 NULLS LAST;