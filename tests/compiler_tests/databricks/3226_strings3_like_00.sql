SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (CAST("50%" AS STRING) LIKE "50\\%" ESCAPE '\\');