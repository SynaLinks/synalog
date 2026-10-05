SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("\u0022; DROP TABLE t; --", "other")) AS x_1) AS pushkin
WHERE
  (x_1 != "other");
