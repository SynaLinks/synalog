SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (CAST("axb" AS STRING) LIKE "a\\_b" ESCAPE '\\');