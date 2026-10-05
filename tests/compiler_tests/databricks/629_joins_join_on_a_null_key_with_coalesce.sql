SELECT
  "none" AS k
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (COALESCE(null, "none") = "none");