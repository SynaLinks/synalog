SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_3) AS pushkin
WHERE
  (NOT (x_3 <=> 1)) AND
  (NOT (x_3 <=> 2));
