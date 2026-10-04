SELECT
  'x' AS v
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 = 1);