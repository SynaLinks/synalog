SELECT
  x_3 AS d
FROM
  LATERAL (SELECT explode(ARRAY("2026-01-05", "2026-03-01")) AS x_3) AS pushkin
WHERE
  (x_3 < "2026-02-01");