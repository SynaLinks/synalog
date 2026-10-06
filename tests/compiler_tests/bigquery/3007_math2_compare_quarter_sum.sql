SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (((0.25) + (0.25)) = 0.5);