SELECT
  SUM(1) AS n
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ('' IS NOT null);