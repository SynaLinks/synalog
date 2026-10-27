SELECT
  1 AS ok
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (COALESCE(null, 5) IS COALESCE(null, 5));