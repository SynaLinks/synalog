SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ((CAST(7 AS DOUBLE) / NULLIF(2, 0)) > 3);