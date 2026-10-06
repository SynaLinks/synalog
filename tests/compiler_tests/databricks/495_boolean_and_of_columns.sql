SELECT
  x_7 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_7) AS pushkin
WHERE
  (((MOD(x_7, NULLIF(2, 0))) = 0) AND (x_7 > 2));