SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(2, 3, 4)) AS x_3) AS pushkin
WHERE
  (x_3 >= 3) AND
  (x_3 <= 3);
