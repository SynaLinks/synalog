SELECT
  1 AS x,
  'two' AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (2 = ((1) + (1)));