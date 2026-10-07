SELECT
  COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)), 0) AS n;