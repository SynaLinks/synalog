SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (CAST("abc" AS STRING) LIKE "a%" ESCAPE '\\');