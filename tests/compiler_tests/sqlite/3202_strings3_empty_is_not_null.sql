SELECT
  1 AS x,
  LENGTH('') AS n
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ('' IS NOT null);