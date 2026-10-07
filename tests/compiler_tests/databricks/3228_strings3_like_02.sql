SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (CAST("a_b" AS STRING) LIKE "a\\_b" ESCAPE '\\');