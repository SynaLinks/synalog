SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("');ATTACH DATABASE 'x' AS y;--", "other")) AS x_1) AS pushkin
WHERE
  (x_1 != "other");
