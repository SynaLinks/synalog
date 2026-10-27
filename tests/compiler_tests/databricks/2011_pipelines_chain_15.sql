SELECT
  x_33 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_33) AS pushkin
WHERE
  (NOT (x_33 <=> 15)) AND
  (NOT (x_33 <=> 14)) AND
  (NOT (x_33 <=> 13)) AND
  (NOT (x_33 <=> 12)) AND
  (NOT (x_33 <=> 11)) AND
  (NOT (x_33 <=> 10)) AND
  (NOT (x_33 <=> 9)) AND
  (NOT (x_33 <=> 8)) AND
  (NOT (x_33 <=> 7)) AND
  (NOT (x_33 <=> 6)) AND
  (NOT (x_33 <=> 5)) AND
  (NOT (x_33 <=> 4)) AND
  (NOT (x_33 <=> 3)) AND
  (NOT (x_33 <=> 2)) AND
  (NOT (x_33 <=> 1));
