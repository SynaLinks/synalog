SELECT
  SUM(x_2) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_2) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_2 = 2)) IS NULL);