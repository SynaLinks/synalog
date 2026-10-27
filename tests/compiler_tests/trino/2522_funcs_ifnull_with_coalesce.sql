SELECT
  1 AS ok
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (COALESCE(null, 5) IS NOT DISTINCT FROM COALESCE(null, 5));