SELECT
  (SELECT
  ARRAY_AGG(1) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS l,
  (SELECT
  ARRAY_AGG(DISTINCT 1) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS s,
  (SELECT
  ARRAY_AGG(1 order by [1][offset(0)]) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS a;