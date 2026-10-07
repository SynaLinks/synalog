SELECT
  (SELECT
  SUM(1) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS s,
  (SELECT
  MAX(1) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS m;