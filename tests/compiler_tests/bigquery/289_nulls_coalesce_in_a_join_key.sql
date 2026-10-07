SELECT
  "a" AS v,
  "default" AS w
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ("none" = COALESCE(null, "none"));