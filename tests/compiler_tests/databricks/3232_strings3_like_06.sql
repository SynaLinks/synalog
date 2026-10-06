SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (CAST("ABC" AS STRING) LIKE "a%" ESCAPE '\\');