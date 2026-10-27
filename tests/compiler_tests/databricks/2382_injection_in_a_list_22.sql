SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("’; DROP TABLE t; --", "other")) AS x_1) AS pushkin
WHERE
  (NOT (x_1 <=> "other"));
