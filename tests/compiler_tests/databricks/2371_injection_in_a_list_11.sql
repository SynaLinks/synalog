SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("\u0024\u0024; DROP TABLE t; \u0024\u0024", "other")) AS x_1) AS pushkin
WHERE
  (x_1 != "other");