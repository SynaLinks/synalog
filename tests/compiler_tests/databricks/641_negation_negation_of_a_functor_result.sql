SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    LATERAL (SELECT explode(ARRAY(1, 2)) AS x_8) AS pushkin
  WHERE
    (x_3 = x_8)) IS NULL);