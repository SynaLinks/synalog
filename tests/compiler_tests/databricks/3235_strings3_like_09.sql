SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (CAST("a%b" AS STRING) LIKE "a\\%%" ESCAPE '\\');