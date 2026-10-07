SELECT
  x_21 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_21) AS pushkin
WHERE
  (x_21 != 9) AND
  (x_21 != 8) AND
  (x_21 != 7) AND
  (x_21 != 6) AND
  (x_21 != 5) AND
  (x_21 != 4) AND
  (x_21 != 3) AND
  (x_21 != 2) AND
  (x_21 != 1);
