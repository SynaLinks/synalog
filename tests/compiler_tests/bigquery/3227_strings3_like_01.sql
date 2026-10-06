SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ("50 percent" LIKE "50\\%");