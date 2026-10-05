SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(4)) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_3 = 5)) IS NULL) ORDER BY x NULLS LAST;