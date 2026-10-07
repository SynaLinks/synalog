SELECT
  1 AS x,
  2 AS y
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (2 = ((1) + (1)));