SELECT
  x_3 AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "b")) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_3 = "a")) IS NULL);