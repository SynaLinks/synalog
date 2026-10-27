SELECT
  x_27 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_27) AS pushkin
WHERE
  (NOT (x_27 <=> 12)) AND
  (NOT (x_27 <=> 11)) AND
  (NOT (x_27 <=> 10)) AND
  (NOT (x_27 <=> 9)) AND
  (NOT (x_27 <=> 8)) AND
  (NOT (x_27 <=> 7)) AND
  (NOT (x_27 <=> 6)) AND
  (NOT (x_27 <=> 5)) AND
  (NOT (x_27 <=> 4)) AND
  (NOT (x_27 <=> 3)) AND
  (NOT (x_27 <=> 2)) AND
  (NOT (x_27 <=> 1));
