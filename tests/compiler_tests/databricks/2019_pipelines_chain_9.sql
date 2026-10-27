SELECT
  x_21 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_21) AS pushkin
WHERE
  (NOT (x_21 <=> 9)) AND
  (NOT (x_21 <=> 8)) AND
  (NOT (x_21 <=> 7)) AND
  (NOT (x_21 <=> 6)) AND
  (NOT (x_21 <=> 5)) AND
  (NOT (x_21 <=> 4)) AND
  (NOT (x_21 <=> 3)) AND
  (NOT (x_21 <=> 2)) AND
  (NOT (x_21 <=> 1));
