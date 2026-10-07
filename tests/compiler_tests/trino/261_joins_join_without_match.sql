SELECT
  1 AS id
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (2 = 1);