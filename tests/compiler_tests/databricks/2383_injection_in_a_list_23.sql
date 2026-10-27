SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("0x27 OR 1", "other")) AS x_1) AS pushkin
WHERE
  (NOT (x_1 <=> "other"));
