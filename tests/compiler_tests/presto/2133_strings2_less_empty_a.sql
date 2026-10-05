SELECT
  1 AS ok
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ('' < 'a');