SELECT
  x_39 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_39) AS pushkin
WHERE
  (x_39 != 18) AND
  (x_39 != 17) AND
  (x_39 != 16) AND
  (x_39 != 15) AND
  (x_39 != 14) AND
  (x_39 != 13) AND
  (x_39 != 12) AND
  (x_39 != 11) AND
  (x_39 != 10) AND
  (x_39 != 9) AND
  (x_39 != 8) AND
  (x_39 != 7) AND
  (x_39 != 6) AND
  (x_39 != 5) AND
  (x_39 != 4) AND
  (x_39 != 3) AND
  (x_39 != 2) AND
  (x_39 != 1);
